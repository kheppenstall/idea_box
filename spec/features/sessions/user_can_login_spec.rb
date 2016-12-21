require 'rails_helper'

RSpec.describe "User visit login page" do
  scenario "successfully logs in" do
    user = create(:user)

    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: "password"
    click_on "Enter"

    expect(current_path).to eq user_path(user)
    expect(page).to have_link "Logged in as #{user.name}", edit_user_path(user)
    expect(page).to have_content "You successfully logged in!"
    expect(page).to have_link "Logout", logout_path
  end

  scenario "enters incorrect data" do

    visit login_path
    click_on "Enter"

    expect(current_path).to eq login_path
    expect(page).to have_content "Name or password incorrect"
    expect(page).to have_link "Login", login_path
    expect(page).to have_link "Create an Account", new_user_path
  end

end