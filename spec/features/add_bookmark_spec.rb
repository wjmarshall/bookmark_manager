feature "Adding a new bookmark" do
  scenario "enables user to add and save a new bookmark" do
    visit("/bookmarks/add") 
    fill_in("url", with: "http://www.youtube.com")
    click_button("Submit")
    expect(page).to have_content("http://www.youtube.com")
  end
end