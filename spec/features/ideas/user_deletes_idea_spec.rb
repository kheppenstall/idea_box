require 'rails_helper'

RSpec.describe "User deletes idea" do
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