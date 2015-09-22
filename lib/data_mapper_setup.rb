require 'data_mapper'
require 'dm-postgres-adapter'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, "postgres://ohbshfahaaymsg:WdR8nuKGUXpmMQRsouqe2MDjXC@ec2-54-204-25-54.compute-1.amazonaws.com:5432/dbjdh8pcmtb2se")
#DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
DataMapper::Logger.new($stdout, :debug)

require './app/models/link'

DataMapper.finalize

DataMapper.auto_upgrade!
