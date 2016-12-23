FactoryGirl.define do
  factory :image do
    description { Faker::Hipster.sentence(3) }
    url         { Faker::Internet.url }
  end
end
