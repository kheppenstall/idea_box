require 'rails_helper'

RSpec.describe "User visits edit path" do
  context "when logged in" do
    scenario "enters valid data" do
      user = logged_in_user
      user.ideas << create(:category_with_ideas).ideas.first

      visit user_ideas_path(user)
      click_on "Edit"

      fill_in "idea[content]", with: "My wonderful idea"
      click_on "Update Idea"

      expect(current_path).to eq user_ideas_path(user)
      expect(page).to have_content "Idea updated!"
      expect(page).to have_content "My wonderful idea"
      expect(page).to have_content Category.first.name
    end

    scenario "enters invalid data" do
      user = logged_in_user
      user.ideas << create(:category_with_ideas).ideas.first

      visit user_ideas_path(user)
      click_on "Edit"

      fill_in "idea[content]", with: ""
      click_on "Update Idea"

      expect(page).to have_content "Content can't be blank"
    end
  end

  context "when logged out" do
    scenario "404" do
      user = create(:user)
      user.ideas << create(:category_with_ideas).ideas.first

      visit user_ideas_path(user)

      expect(current_path).to eq login_path
      expect(page).to have_content "Login required to access page"
    end
  end
end