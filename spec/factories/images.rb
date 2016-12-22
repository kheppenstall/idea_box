FactoryGirl.define do
  factory :image do
    description { Faker::Team.creature }
    url         { Faker::Avatar.image }
  end
end
