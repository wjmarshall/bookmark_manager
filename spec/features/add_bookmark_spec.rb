feature "Adding a new bookmark" do
  scenario "enables user to add and save a new bookmark" do
    visit("/bookmarks/add") 
    fill_in("url", with: "http://www.youtube.com")
    fill_in("title", with: "YouTube")
    click_button("Submit")
    expect(page).to have_link("YouTube", href: "http://www.youtube.com")
  end
end