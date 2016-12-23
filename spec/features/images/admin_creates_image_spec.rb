require 'rails_helper'

RSpec.describe "Create new image" do
  context "admin" do
    scenario "with valid data" do
      url = "http://r.ddmcdn.com/s_f/o_1/cx_633/cy_0/cw_1725/ch_1725/w_720/APL/uploads/2014/11/too-cute-doggone-it-video-playlist.jpg"
      login_admin

      visit root_path
      click_on "Images"
      click_on "Add Image"

      fill_in "image[url]", with: url
      fill_in "image[description]", with: "Dog"
      click_on "Create Image"

      expect(current_path).to eq admin_images_path
      expect(page).to have_content "Image added!"
      expect(Image.count).to eq 1
      expect(page).to have_content "Dog"
    end

    scenario "with invalid data" do
      login_admin

      visit new_admin_image_path
      click_on "Create Image"

      expect(page).to have_content "Url can't be blank"
      expect(Image.count).to eq 0
    end
  end

  context "default user" do
    scenario "404" do
      user = logged_in_user

      visit new_admin_image_path

      expect(page).to have_content "The page you were looking for doesn't exist"
    end
  end
end