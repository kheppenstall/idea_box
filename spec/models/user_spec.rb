require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:role) }
    it { is_expected.to validate_uniqueness_of (:email) }
  end

  context "associations" do
    it { should have_many(:ideas) }
  end

  context "role" do
    it "set to admin" do
      user = create(:user, role: 1)

      expect(user.role).to eq "admin"
      expect(user.admin?).to be_truthy
    end

    it "defaults to default" do
      user = create(:user)

      expect(user.role).to eq "default"
      expect(user.admin?).to be_falsy

    end
  end
end