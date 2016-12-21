require 'rails_helper'

RSpec.describe "User logs out" do
  scenario "when logged in" do
    user = create(:user)
    visit new_user_path
    click_on "Login"

    expect(current_path).to eq login_path

    fill_in "email", with: user.email
    fill_in "password", with: "password"
    click_on "Enter"

    click_on "Logout"

    expect(current_path).to eq login_path
    expect(page).to have_content "You are now logged out."
    expect(page).to have_link "Login", login_path
    expect(page).to have_link "Create an Account", new_user_path
  end

  scenario "when already logged out" do
    visit login_path

    expect(page).to_not have_content "Logout"
  end
end