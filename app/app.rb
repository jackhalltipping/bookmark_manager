require 'sinatra/base'
require './app/models/link'
require 'data_mapper'
require './app/data_mapper_setup.rb'
require 'sinatra/flash'

class App < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  get '/' do
    redirect 'links'
  end

  get '/links' do
    @links = Link.all
    erb :index
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tags = params[:tag].split(' ')
    tags.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect to('/links')
  end

  get '/links/new' do
    erb :new
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/')
    else
      flash.now[:notice] = 'Sorry, your passwords do not match'
      erb :'users/new'
    end
  end

  def current_user
    User.get(session[:user_id])
  end
end
