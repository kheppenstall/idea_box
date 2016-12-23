FactoryGirl.define do
  factory :category do
    name { Faker::Commerce.department + rand(100).to_s }

    factory :category_with_ideas do
      ideas { create_list(:idea, 3) }
    end
  end
end