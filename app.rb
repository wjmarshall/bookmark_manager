require "sinatra/base"
require "sinatra/reloader"
require "./lib/bookmark"

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    "Bookmark Manager"
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.all
    erb(:"bookmarks/index")
  end

  get "/bookmarks/add" do
    erb(:"bookmarks/add")
  end

  post "/bookmarks" do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect to("/bookmarks")
  end

  delete "/bookmarks/:id" do
    Bookmark.delete(id: params[:id])
    redirect to("/bookmarks")
  end

  get "/bookmarks/:id/edit" do
    @bookmark = Bookmark.find(id: params[:id])
    erb(:"bookmarks/edit")
  end

  patch "/bookmarks/:id" do
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect to("/bookmarks")
  end


  run! if app_file == $0
end