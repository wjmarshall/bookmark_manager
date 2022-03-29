class Bookmark
  attr_reader :url

  @@bookmarks = []

  def initialize(url)
    @url = url
    @@bookmarks << self
  end

  def self.all
    @@bookmarks
  end

end