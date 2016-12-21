def logged_in_user
    user = create(:user)

    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: "password"
    click_on "Enter"

    user
end

def login_admin
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(create_admin)
    allow_any_instance_of(Admin::BaseController).to receive(:current_admin?).and_return(true)
end

def create_admin
    create(:user, role: 1)
end