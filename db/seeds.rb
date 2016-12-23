# FactoryGirl.create_list(:category, 10)

Category.create(name: "Space")
Category.create(name: "Adventure")
Category.create(name: "Technology")
Category.create(name: "People")
Category.create(name: "Transportation")
Category.create(name: "Travel")
Category.create(name: "Education")

Image.create(description: "Space", url: "http://marshall.org/wp-content/themes/marshall/img/featured-space-policy.jpg")
Image.create(description: "Dog", url: "http://cdn3-www.dogtime.com/assets/uploads/gallery/30-impossibly-cute-puppies/impossibly-cute-puppy-15.jpg")
Image.create(description: "Coffee cat", url: "https://images.pexels.com/photos/209609/pexels-photo-209609.jpeg?w=940&h=650&auto=compress&cs=tinysrgb")
Image.create(description: "Bear family", url: "https://images.pexels.com/photos/34047/pexels-photo.jpg?w=940&h=650&auto=compress&cs=tinysrgb")
Image.create(description: "Lakeside Dock", url: "https://images.pexels.com/photos/158094/lake-sky-reflection-water-158094.jpeg?w=940&h=650&auto=compress&cs=tinysrgb")
Image.create(description: "Eiffel Tower", url: "https://images.pexels.com/photos/94873/pexels-photo-94873.jpeg?w=940&h=650&auto=compress&cs=tinysrgb")
Image.create(description: "Wooden Bridge", url: "https://images.pexels.com/photos/104822/pexels-photo-104822.jpeg?w=940&h=650&auto=compress&cs=tinysrgb")
Image.create(description: "Colored Pencils", url: "https://images.pexels.com/photos/254717/pexels-photo-254717.jpeg?w=940&h=650&auto=compress&cs=tinysrgb")
Image.create(description: "Lizard", url: "https://images.pexels.com/photos/37068/pexels-photo.jpg?w=940&h=650&auto=compress&cs=tinysrgb")


admin = User.create(name: "admin", password: "admin", email: "admin@admin.com", role: 1)

# 5.times do |x|
#   offset = rand(Category.count)
#   idea = FactoryGirl.create(:idea, category: Category.offset(offset).first)
#   idea.images << Image.all.sample(3)
#   admin.ideas << idea
# end

user = User.create(name: "A User Has No Name", password: "user", email: "user@hasnoname.com")

# 5.times do |x|
#   offset = rand(Category.count)
#   idea = FactoryGirl.create(:idea, category: Category.offset(offset).first)
#   idea.images << Image.all.sample(3)
#   user.ideas << idea
# end

# 5.times do |n|
#   user = FactoryGirl.create(:user)
#   5.times do |x|
#     offset = rand(Category.count)
#     idea = FactoryGirl.create(:idea, category: Category.offset(offset).first)
#     idea.images << Image.all.sample(2)
#     user.ideas << idea
#   end
# end