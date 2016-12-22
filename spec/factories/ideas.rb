FactoryGirl.define do
  factory :idea do
    content { Faker::Hacker.say_something_smart }
    category Category.new
    user     User.new
  end
end