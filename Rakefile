require 'data_mapper'



task :auto_upgrade, [:arg1] do |t, arg1|
  ENV['RACK_ENV']  = arg1[:arg1]
  require './lib/data_mapper_setup'
  #require './lib/data_mapper_setup'
  # auto_upgrade makes non-destructive changes.
  # If your tables don't exist, they will be created
  # but if they do and you changed your schema
  # (e.g. changed the type of one of the properties)
  # they will not be upgraded because that'd lead to data loss.
  DataMapper.auto_upgrade!
  puts 'Auto-upgrade complete (no data loss)'
end

task :auto_migrate, [:arg1] do |t, arg1|
  ENV['RACK_ENV'] = arg1[:arg1]
  require './lib/data_mapper_setup'
#  require './lib/data_mapper_setup'
  # To force the creation of all tables as they are
  # described in your models, even if this
  # may lead to data loss, use auto_migrate:
  DataMapper.auto_migrate!
  puts 'Auto-migrate complete (data could have been lost)'
end
