require 'rails_helper'

RSpec.describe "Visits categories index" do
  context "admin" do
    scenario "sees all categories" do
      login_admin
      category_one, category_two = create_list(:category, 2)

      visit admin_categories_path

      expect(page).to have_content category_one.name
      expect(page).to have_content category_two.name
    end

    scenario "deletes a category" do
      login_admin
      category = create(:category)
      name = category.name

      visit admin_categories_path
      click_on "Delete"

      expect(current_path).to eq admin_categories_path
      expect(page).to have_content "#{category.name} deleted."
      expect(Category.count).to eq 0
    end

    scenario "deletes category and jobs are deleted" do
      login_admin
      category = create(:category_with_ideas)
        expect(Idea.count).to eq 3
      visit admin_categories_path
      click_on "Delete"

      expect(Category.count).to eq 0
      expect(Idea.count).to eq 0
    end
  end

  context "default user" do
    scenario "404" do
      user = logged_in_user
      visit admin_categories_path

      expect(page).to have_content "The page you were looking for doesn't exist (404)"
    end
  end
end