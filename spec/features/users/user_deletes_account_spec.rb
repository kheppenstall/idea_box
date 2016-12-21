require 'rails_helper'

RSpec.describe "User deletes an account" do
  scenario "from an edit page" do
    user = logged_in_user

    visit edit_user_path(user)
    click_on "Delete Account"

    expect(page).to have_content "Account deleted" 
    expect(current_path).to eq new_user_path
    expect(User.count).to eq 0
  end

  scenario "and all ideas are deleted" do
    user = logged_in_user
    user.ideas << create_list(:idea, 5)

    expect(Idea.count).to eq 5

    visit edit_user_path(user)
    click_on "Delete Account"

    expect(Idea.count).to eq 0
  end
end