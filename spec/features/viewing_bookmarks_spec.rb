feature "Viewing bookmarks" do
  scenario "visiting the index page" do
    visit("/")
    expect(page).to have_content("Bookmark Manager")
  end

  scenario "visiting the /bookmarks page" do
    visit("/bookmarks")
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://www.youtube.com")
    expect(page).to have_content("http://www.reddit.com")
  end
end