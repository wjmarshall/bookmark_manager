feature "Update bookmark" do
  scenario "User can update a bookmark" do
    bookmark = Bookmark.create(title: "Makers Academy", url: "http://www.makersacademy.com")
    visit("/bookmarks")
    expect(page).to have_link("Makers Academy", href: "http://www.makersacademy.com")
    first(".bookmark").click_button("Edit")
    expect(current_path).to eq("/bookmarks/#{bookmark.id}/edit")
    fill_in("url", with: "http://www.youtube.com")
    fill_in("title", with: "YouTube")
    click_button("Submit")
    # expect(current_path).to eq("/bookmarks")
    expect(page).to have_link("YouTube", href: "http://www.youtube.com")
    expect(page).not_to have_link("Makers Academy", href: "http://www.makersacademy.com")
  end
end
