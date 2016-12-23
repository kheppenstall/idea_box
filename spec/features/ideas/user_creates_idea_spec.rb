require 'rails_helper'

RSpec.describe "Creates idea" do
  context "user" do

    scenario "with valid attributes" do
      user = logged_in_user
      category = create(:category)
      image = create(:image)

      visit new_user_idea_path(user)

      fill_in "idea[content]", with: "Very important idea."
      select category.name, from: "idea[category_id]"
      select image.description, from: "idea[images][]"

      click_on "Create Idea"

      expect(current_path).to eq user_idea_path(user, Idea.first)
      expect(page).to have_content "Idea added!"
      expect(page).to have_content "Very important idea"
      expect(page).to have_content category.name
    end

    scenario "with invalid attributes" do
      user = logged_in_user

      visit new_user_idea_path(user)
      click_on "Create Idea"

      expect(page).to have_content "Content can't be blank"
    end
  end

  context "visitor" do
    scenario "redirect to login" do
      user = create(:user)

      visit new_user_idea_path(user)

      expect(page).to have_content "Login required to access page."
      expect(current_path).to eq login_path
    end
  end
end