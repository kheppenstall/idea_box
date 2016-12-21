require 'rails_helper'

RSpec.describe "Visits ideas index" do
  context "user"
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

  context "visitor" do
    scenario "redirect to login" do
      user = create(:user)

      visit user_ideas_path(user)

      expect(page).to have_content "Login required to access page."
      expect(current_path).to eq login_path
    end
  end
end