require 'rails_helper'

RSpec.describe Image, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:description) }
    it { is_expected.to validate_uniqueness_of(:url) }
  end

  context "associations" do
    it { should have_many(:idea_images) }
    it { should have_many(:ideas) }
  end
end
