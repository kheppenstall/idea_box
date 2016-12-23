require 'rails_helper'

RSpec.describe "Delete image" do
  context "as admin" do
    scenario "remove from database" do
      create(:image)
      login_admin

      visit admin_images_path

      click_on "Delete"

      expect(current_path).to eq admin_images_path
      expect(Image.count).to eq 0
      expect(page).to have_content "Image removed."
    end

    scenario "associated ideas remain" do
      idea = create(:category_with_ideas).ideas.first
      idea.images << create(:image)
      logged_in_user.ideas << idea

      login_admin
      visit admin_images_path
      click_on "Delete"


      expect(current_path).to eq admin_images_path
      expect(page).to have_content "Image removed"
      expect(Image.count).to eq 0
      expect(Idea.count).to eq 3
    end
  end

  context "as default user" do
    scenario "404" do
      user = logged_in_user

      visit admin_images_path

      expect(page).to have_content "The page you were looking for doesn't exist."
    end
  end
end