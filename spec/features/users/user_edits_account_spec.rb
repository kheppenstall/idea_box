require 'rails_helper'

RSpec.describe "User edits account" do
  scenario "with valid data" do
    user = logged_in_user

    visit edit_user_path(user)

    fill_in "user[name]", with: "New Name"
    fill_in "user[email]", with: "email@email.com"
    fill_in "user[password]", with: "New Password"

    click_on "Update User"

    expect(current_path).to eq user_path(user)
    # expect(page).to have_content "Logged in as New Name"
  end

  scenario "with invalid data" do
    user = logged_in_user

    visit edit_user_path(user)

    fill_in "user[name]", with: ""

    click_on "Update User"

    expect(page).to have_content "Name can't be blank"
  end
end