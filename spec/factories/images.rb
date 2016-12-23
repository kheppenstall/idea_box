FactoryGirl.define do
  factory :image do
    description { Faker::Hipster.sentence(3) }
    url         { Faker::Company.logo }
  end
end
