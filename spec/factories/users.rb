FactoryGirl.define do
  factory :user do
    name      { Faker::Name.name }
    password  { "password" }
    email     { Faker::Internet.email(name) }
  end
end