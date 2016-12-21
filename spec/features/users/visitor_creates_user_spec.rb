require 'rails_helper'

RSpec.describe "User visits login page" do
  scenario "enters valid data to create an account" do
    visit new_user_path

    fill_in "user[name]", with: "Kyle"
    fill_in "user[email]", with: "kyle@example.com"
    fill_in "user[password]", with: "password"

    click_on "Create User"

    user = User.first

    expect(current_path).to eq login_path
    expect(page).to have_content "Account successfully created!"
  end

  scenario "enters invalid data to create an account" do
    visit new_user_path

    click_on "Create User"

    expect(page).to have_content "Name can't be blank"
  end

  scenario "enters email address already in database" do
    user = create(:user)

    visit new_user_path

    fill_in "user[name]", with: user.name
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: "password"

    click_on "Create User"

    expect(page).to have_content "Email has already been taken"
  end
  
end