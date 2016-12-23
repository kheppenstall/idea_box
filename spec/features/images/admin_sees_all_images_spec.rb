require 'rails_helper'

RSpec.describe "Images path" do
  context "as admin" do
    scenario "see all images" do
      create_list(:image, 2)
      login_admin

      visit admin_images_path

      Image.all.each do |image|
        expect(page).to have_content image.description
      end
    end
  end

  context "as default user" do
    scenario "404" do
      logged_in_user

      visit admin_images_path

      expect(page).to have_content "The page you were looking for doesn't exist"
    end
  end
end