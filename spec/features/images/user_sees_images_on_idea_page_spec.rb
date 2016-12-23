require 'rails_helper'

RSpec.describe "User visits an idea page" do
  scenario "sees idea and related images" do
    user = logged_in_user

    idea = create(:category_with_ideas).ideas.first
    image = create(:image)
    idea.images << image
    user.ideas << idea

    visit user_idea_path(user, idea)
    
    expect(page).to have_content idea.content
    expect(page).to have_content image.description
    expect(page).to have_content idea.category.name
  end
end