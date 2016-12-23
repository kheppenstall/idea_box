FactoryGirl.create_list(:category, 10)

Image.create(description: "Space", url: "http://marshall.org/wp-content/themes/marshall/img/featured-space-policy.jpg")
Image.create(description: "Dog", url: "http://cdn3-www.dogtime.com/assets/uploads/gallery/30-impossibly-cute-puppies/impossibly-cute-puppy-15.jpg")

admin = User.create(name: "admin", password: "admin", email: "admin@admin.com", role: 1)

5.times do |x|
  offset = rand(Category.count)
  idea = FactoryGirl.create(:idea, category: Category.offset(offset).first)
  idea.images << Image.all.sample(2)
  admin.ideas << idea
end

5.times do |n|
  user = FactoryGirl.create(:user)
  5.times do |x|
    offset = rand(Category.count)
    idea = FactoryGirl.create(:idea, category: Category.offset(offset).first)
    idea.images << Image.all.sample(2)
    user.ideas << idea
  end
end