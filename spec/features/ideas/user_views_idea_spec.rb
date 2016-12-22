require 'rails_helper'

RSpec.describe "Visit idea page" do
  context "logged in" do
    scenario "see idea" do
      user = logged_in_user
      idea = create(:category_with_ideas).ideas.first
      user.ideas << idea

      visit user_ideas_path(user)
      click_on "View"

      expect(current_path).to eq user_idea_path(user, idea)
      expect(page).to have_content idea.content
      expect(page).to have_content idea.category.name
      expect(page).to have_link "My Ideas", user_ideas_path(user)
    end
  end

  context "logged out" do
    scenario "404" do
      user = create(:user)
      idea = create(:category_with_ideas).ideas.first
      user.ideas << idea

      visit user_idea_path(user, idea)

      expect(current_path).to eq login_path
      expect(page).to have_content "Login required to access page"
    end
  end
end