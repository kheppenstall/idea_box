require 'rails_helper'

RSpec.describe "User visits ideas index" do
  context "when logged in"
    scenario "sees ideas and their categories" do
      user = logged_in_user
      ideas = create(:category_with_ideas).ideas
      user.ideas << ideas

      visit user_ideas_path(user)

      expect(page).to have_content "Ideas"
      expect(page).to have_content Category.first.name
      ideas.each do |idea|
        expect(page).to have_content idea.content
      end
    end
  context "when logged out" do
    scenario "404 raised" do
      user = create(:user)

      visit user_ideas_path(user)

      expect(current_path).to eq login_path
    end
  end
end