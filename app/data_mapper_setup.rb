require 'data_mapper'
require './app/models/link.rb'
require './app/models/tag.rb'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
