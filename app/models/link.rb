class Link

  require 'data_mapper'
  # DataMapper::Logger.new($stdout, :debug)
  # DataMapper.setup(:default, "postgres://localhost/bookmark_manager")

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String

end