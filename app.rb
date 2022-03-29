require "sinatra/base"
require "sinatra/reloader"

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    "Bookmark Manager"
  end

  get "/bookmarks" do
    "http://www.google.com, http://www.youtube.com, http://www.reddit.com"
  end


  run! if app_file == $0
end