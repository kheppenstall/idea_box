require 'rails_helper'

RSpec.describe "Delete account" do
  context "user" do
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

  context "different_user" do
    scenario "tries to delete another user's account" do
      user_one = create(:user)
      user_two = logged_in_user

      visit edit_user_path(user_one)

      expect(User.count).to eq 2
      expect(page).to have_content "Login required to access page"
      expect(current_path).to eq login_path
    end
  end
end