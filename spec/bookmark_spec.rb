require "bookmark"

describe Bookmark do
  let(:bookmark_1) { Bookmark.new("http://www.google.com") }
  let(:bookmark_2) { Bookmark.new("http://www.youtube.com") }
  let(:bookmark_3) { Bookmark.new("http://www.reddit.com") }

  describe "::all" do
    it "returns a list of all bookmark instances" do
      expect(Bookmark.all).to eq([bookmark_1, bookmark_2, bookmark_3])
    end
  end
end
