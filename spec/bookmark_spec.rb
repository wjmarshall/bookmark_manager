require "bookmark"

describe Bookmark do

  describe "::all" do
    it "returns a list of all bookmarks" do
      connection = PG.connect(dbname: "bookmark_manager_test")
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")
      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq(3)
      expect(bookmarks.first).to be_a(Bookmark)
      expect(bookmarks.first.id).to eq(bookmark.id)
      expect(bookmarks.first.title).to eq("Makers Academy")
      expect(bookmarks.first.url).to eq("http://www.makersacademy.com")
    end
  end

  describe "::create" do
    it "creates a new bookmark" do
      bookmark = Bookmark.create(url: "http://www.youtube.com", title: "YouTube")
      persisted_data = PG.connect(dbname: "bookmark_manager_test").query("SELECT * FROM bookmarks WHERE id = #{bookmark.id}")
      expect(bookmark).to be_a(Bookmark)
      expect(bookmark.id).to eq(persisted_data.first["id"])
      expect(bookmark.url).to eq("http://www.youtube.com")
      expect(bookmark.title).to eq("YouTube")
    end
  end

  describe "::delete" do
    it "deletes a bookmark" do
      bookmark = Bookmark.create(url: "http://www.youtube.com", title: "YouTube")
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq(0)
    end
  end

end
