require "pg"

class Bookmark

  def self.all
    if ENV["RACK_ENV"] == "test"
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end
    result = connection.exec("SELECT * from bookmarks")
    result.map { |bookmark| bookmark["url"] }
  end

end
