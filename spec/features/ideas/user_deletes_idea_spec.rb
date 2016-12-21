require 'rails_helper'

RSpec.describe "Deletes idea" do
  context "user" do
    scenario "from idea index" do
      user = logged_in_user
      idea = create(:idea, category: create(:category))
      user.ideas << idea

      visit user_ideas_path(user)
      click_on "Delete"

      expect(current_path).to eq user_ideas_path(user)
      expect(page).to have_content "Idea deleted"
      expect(Idea.count).to eq 0
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