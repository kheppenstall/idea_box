def logged_in_user
    user = create(:user)

    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: "password"
    click_on "Enter"

    user
end