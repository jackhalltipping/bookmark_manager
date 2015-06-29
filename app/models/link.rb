class Link

  require 'data_mapper'
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String

end
