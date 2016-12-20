require 'rails_helper'

RSpec.describe "User visits login page" do
  scenario "enters valid data to create an account" do

    visit new_user_path

    fill_in "user[name]", with: "Kyle"
    fill_in "user[email]", with: "kyle@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Create Account"

    expect(current_path).to eq user_path(User.first)
    expect(page).to have_content "Account successfully created!"
    expect(page).to have_content "Logged in as Kyle"
    expect(page).to have_content "kyle@example.com"
  end

  # scenario "enters invalid data to create an account" do
  
  # end
end