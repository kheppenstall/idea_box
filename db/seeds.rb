FactoryGirl.create_list(:category, 10)
FactoryGirl.create_list(:image, 10)

5.times do |n|
  user = FactoryGirl.create(:user)
  5.times do |x|
    offset = rand(Category.count)
    idea = FactoryGirl.create(:idea, category: Category.offset(offset).first)
    idea.images << Image.all.sample(2)
    user.ideas << idea
  end
end