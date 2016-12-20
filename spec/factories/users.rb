FactoryGirl.define do
  factory :user do
    name      { Faker::Name.unique.name }
    password  { Faker::Internet.password(name) }
    email     { Faker::Internet.email }
  end
end
