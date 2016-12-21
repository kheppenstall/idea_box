require 'rails_helper'

RSpec.describe "Admin visits categories index" do
  scenario "sees all categories" do
    category_one, category_two = create_list(:category, 2)

    visit categories_path

    expect(page).to have_content category_one.name
    expect(page).to have_content category_two.name
  end

  scenario "deletes a category" do
    category = create(:category)
    name = category.name

    visit categories_path
    click_on "Delete"

    expect(current_path).to eq categories_path
    expect(page).to have_content "#{category.name} deleted."
    expect(Category.count).to eq 0
  end

  # scenario "deletes category and jobs are deleted" do
  #   category = create(:category_with_ideas)

  #   visit categories_path
  #   click_on "Delete"

  #   expect(Category.count).to eq 0
  #   expect(Job.count).to eq 0
  # end
end