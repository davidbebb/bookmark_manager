require 'sinatra/base'
require './lib/data_mapper_setup'


class Bookmark_manager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'


  get '/' do
    'Hello bookmark_manager!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/addlink'
  end

  post '/links/new' do
    link = Link.create(url: params[:url], title: params[:title])
    tags = params[:tags].split()
    tag = []
    tags.each do |name|
      p link.tags  << Tag.create(name: name )
    end
    link.save
    redirect 'links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password])
    p user
    session[:user_id] = user.id
    redirect to('/links')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
