require 'rails_helper'

RSpec.describe "Admin visits new category page" do
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