require 'data_mapper'
require './app/models/tag.rb'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{env}")

require './app/models/link'
require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!
