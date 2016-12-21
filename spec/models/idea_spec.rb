require 'rails_helper'

RSpec.describe Idea, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:content) }
  end

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
    # it { should have_many(:image_ideas) }
    # it { should have_many(:images, through: :image_ideas) }
  end
end
