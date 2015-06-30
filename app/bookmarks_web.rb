require 'sinatra/base'
require './app/models/link.rb'
require_relative 'data_mapper_setup.rb'

class BookmarksWeb < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    'Hello BookmarksWeb!'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.create(name: params[:tag])
    link.tags << tag
    link.save
    redirect to('/links')
  end

  get '/links/new' do
    erb :'links/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
