require 'rails_helper'

RSpec.describe "Visit new category page" do
  context "admin" do
    scenario "creates a new category" do
      login_admin
      visit new_admin_category_path

      fill_in "category[name]", with: "Space"
      click_on "Create Category"

      expect(page).to have_content "Category Space created!"
      expect(current_path).to eq admin_categories_path
      expect(Category.count).to eq 1
    end

    scenario "enters redundant name" do
      login_admin
      category = create(:category)
      visit new_admin_category_path

      fill_in "category[name]", with: category.name
      click_on "Create Category"

      expect(page).to have_content "Name has already been taken"
      expect(Category.count).to eq 1
    end
  end

  context "default user" do
    scenario "404" do
      user = logged_in_user
      visit new_admin_category_path

      expect(page).to have_content "The page you were looking for doesn't exist (404)"
    end
  end
end