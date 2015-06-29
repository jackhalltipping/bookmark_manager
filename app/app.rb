require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views')}


end