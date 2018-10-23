require 'sinatra/base'
require './lib/bookmark'

class MyApp < Sinatra::Base

  get '/' do
    erb :homepage
  end

  get '/bookmarks' do
    @bookmark = Bookmark.create
    @sites = @bookmark.view
    erb :bookmark
  end

  run! if app_file == $0

end
