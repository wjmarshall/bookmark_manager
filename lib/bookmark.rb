require "pg"

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV["RACK_ENV"] == "test"
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end
    result = connection.exec("SELECT * FROM bookmarks")
    result.map do |bookmark|
      Bookmark.new(id: bookmark["id"], title: bookmark["title"], url: bookmark["url"])
    end
  end

  def self.create(url:, title:)
    if ENV["RACK_ENV"] == "test"
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end
    result = connection.exec_params("INSERT INTO bookmarks (title, url) VALUES($1, $2) RETURNING id, title, url", [title, url])
    Bookmark.new(id: result[0]["id"], title: result[0]["title"], url: result[0]["url"])
  end

  def self.delete(id:)
    if ENV["RACK_ENV"] == "test"
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end
    connection.exec_params("DELETE FROM bookmarks WHERE id = $1", [id])
  end

  def self.update(id:, url:, title:)
    if ENV["RACK_ENV"] == "test"
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end
    result = connection.exec_params("UPDATE bookmarks SET url = $1, title = $2 WHERE id = $3 RETURNING id, title, url", [url, title, id])
    Bookmark.new(id: result[0]["id"], url: result[0]["url"], title: result[0]["title"])
  end

  def self.find(id:)
    if ENV["RACK_ENV"] == "test"
      connection = PG.connect(dbname: "bookmark_manager_test")
    else
      connection = PG.connect(dbname: "bookmark_manager")
    end
    result = connection.exec_params("SELECT * FROM bookmarks WHERE id = $1", [id])
    Bookmark.new(id: result[0]["id"], title: result[0]["title"], url: result[0]["url"])
  end

end
