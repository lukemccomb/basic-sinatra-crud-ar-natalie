require "spec_helper.rb"

feature "homepage" do
  scenario "should have a button" do
    visit "/"
    expect(page).to have_content("Register")
  end
end
feature "registration_form" do
  scenario "links to registration form" do
    visit "/"
    click_link("Register")
    expect(page).to have_content("username")
  end
end

