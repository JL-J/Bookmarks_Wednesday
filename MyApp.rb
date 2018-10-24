require 'sinatra/base'
require './lib/bookmark'

class MyApp < Sinatra::Base

  before do
    @bookmark = Bookmark.create
  end

  get '/' do
    erb :homepage
  end

  get '/bookmarks' do
    @sites = @bookmark.view
    erb :bookmark
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/add_bookmark'  do
    @bookmark.add(params[:url], params[:title])
    redirect '/new_bookmark'
  end

  get '/new_bookmark' do
    erb :new_bookmark
  end

  get '/delete_bookmark' do
    erb :delete_bookmark
  end

  post '/delete_bookmark' do
    @bookmark.remove(params[:title])
    redirect '/deleted_bookmark'
  end

  get '/deleted_bookmark' do
    erb :deleted_bookmark
  end

  run! if app_file == $0

end
