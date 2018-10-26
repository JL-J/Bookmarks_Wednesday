require 'sinatra/base'
require './lib/bookmark'

class MyApp < Sinatra::Base

  before do
    @bookmark = Bookmark.create
  end

  get '/' do
    @sites = @bookmark.view
    erb :homepage
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/add_bookmark'  do
    @bookmark.add(params[:url], params[:title])
    redirect '/'
  end

  get '/new_bookmark' do
    erb :new_bookmark
  end

  get '/delete_bookmark' do
    erb :delete_bookmark
  end

  post '/delete_bookmark' do
    @bookmark.remove(params[:title])
    redirect '/'
  end

  get '/edit_bookmark' do
    erb :edit_bookmark
  end

  post '/edit_bookmark' do
    @bookmark.edit(params[:current_title], params[:new_title], params[:new_url])
    redirect '/'
  end

  run! if app_file == $0

end
