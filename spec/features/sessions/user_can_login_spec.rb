require 'rails_helper'

RSpec.describe "User visit login page" do
  scenario "successfully logs in" do
    user = create(:user)

    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: "password"
    click_on "Login"

    expect(current_path).to eq user_path(user)
    expect(page).to have_content "You successsfully logged in!"
    expect(page).to have_content "Logged in as #{user.name}"
  end


  # scenario "enters incorrect data" do

  # end

end