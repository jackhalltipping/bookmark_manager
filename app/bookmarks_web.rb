require 'sinatra/base'

class BookmarksWeb < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    'Hello BookmarksWeb!'
  end

  get '/links' do
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
