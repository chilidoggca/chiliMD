# User.destroy_all
# Post.destroy_all
# Medium.destroy_all
# Tag.destroy_all
# Tagging.destroy_all
# Relationship.destroy_all

# PASSWORD = 'supersecret'

# Admin
# super_user = User.create(
#   first_name: 'Jon',
#   last_name: 'Snow',
#   email: 'js@winterfell.gov',
#   password: PASSWORD,
#   is_admin: true
# )

# 20.times.each do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#
#   User.create(
#     first_name: first_name,
#     last_name: last_name,
#     email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
#     password: PASSWORD,
#     # address: "Vancouver, BC #{postal_codes_van[rand(0..354)]}, Canada",
#     location: "Vancouver, BC",
#     latitude: 49.2780017  + (rand(1000) / 10000.0),
#     longitude: -123.1203521 + (rand(1000) / 10000.0),
#   )
# end
#
# 10.times.each do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#
#   User.create(
#     first_name: first_name,
#     last_name: last_name,
#     email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
#     password: PASSWORD,
#     location: "La Ronge, SK",
#     latitude: 55.1082  + (rand(1000) / 10000.0),
#     longitude: -105.2860 + (rand(1000) / 10000.0),
#   )
# end
#
# 20.times.each do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#
#   User.create(
#     first_name: first_name,
#     last_name: last_name,
#     email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
#     password: PASSWORD,
#     location: "New York, NY",
#     latitude: 40.7128  + (rand(1000) / 10000.0),
#     longitude: -74.0060 + (rand(1000) / 10000.0),
#   )
# end
#
# 20.times.each do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#
#   User.create(
#     first_name: first_name,
#     last_name: last_name,
#     email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
#     password: PASSWORD,
#     location: "Kampala, Uganda",
#     latitude: 0.3476  + (rand(1000) / 10000.0),
#     longitude: 32.5825 + (rand(1000) / 10000.0),
#   )
# end


users = User.all
# puts Cowsay.say("Created #{users.count} users", :tux)

# images = ['image01.jpg','image02.jpg','image03.jpg','image04.jpg','image05.jpg',
#   'image06.jpg','image07.jpg','image08.jpg','image09.jpg','image10.jpg',
#   'image11.jpg','image12.jpg','image13.jpg','image14.jpg','image15.jpg',
#   'image16.jpg','image17.jpg','image18.jpg','image19.jpg','image20.jpg']
# users.each do |user|
#   if user.id > 7
#     puts 'success' if user.update(
#       # default_image: Rails.root.join("app/assets/images/user_profile_images", images.sample).open,
#       default_image: "/user_profile_images/" + images.sample,
#     )
#   end
# end

# users.each do |user|
#   rand(1..3).times.each do
#     Post.create(
#       title: Faker::Hipster.sentence(3, false, 4),
#       body: Faker::Hipster.paragraph(2, false, 5),
#       published: true,
#       user: user
#     )
#   end
# end

posts = Post.all
# puts Cowsay.say("Created #{posts.count} posts", :ghostbusters)
#
# posts.each do |post|
#   rand(1..5).times.each do
#     Comment.create(
#       commentable: post,
#       body: Faker::Hipster.paragraph(2, false, 5),
#       user: users.sample,
#     )
#   end
# end

# users.each do |user|
#   follower_arr = []
#   rand(1..20).times.each do
#     us = users.sample
#     follower_arr << us unless follower_arr.include?(us)
#   end
#   follower_arr.each { |follower| follower.follow(user) }
# end



# comments = Comment.all

# puts Cowsay.say("Created #{comments.count} comments", :moose)
#
# ["Emergency", "Pediatrics", "Internal Medicine", "Endocrinology", "Public Health",
#   "Family Medicine", "Surgery", "OBGYN", "Psychiatry"].each do |t|
#   Tag.create(
#     name: t
#   )
# end

media = Medium.all
tags = Tag.all
posts.each do |post|
  if post.id >= 220
    rand(1..5).times.each do
      Comment.create(
        commentable: post,
        body: Faker::Hipster.paragraph(2, false, 5),
        user: users.sample,
      )
    end
    users_arr = []
    rand(3..20).times.each do
      us = users.sample
      users_arr << us unless users_arr.include?(us)
    end
    users_arr.each do |u|
      Like.create(
        likeable: post,
        user: u
      )
    end
  end
  # tags_arr = []
  # rand(1..4).times.each do
  #   ts = tags.sample
  #   tags_arr << ts unless tags_arr.include?(ts)
  # end
  # tags_arr.each do |t|
  #   Tagging.create(tag: t, taggable: post)
  # end
end
media.each do |medium|
  rand(1..5).times.each do
    Comment.create(
      commentable: medium,
      body: Faker::Hipster.paragraph(2, false, 5),
      user: users.sample,
    )
  end
  users_arr = []
  rand(3..20).times.each do
    us = users.sample
    users_arr << us unless users_arr.include?(us)
  end
  users_arr.each do |u|
    Like.create(
      likeable: medium,
      user: u
    )
  end
  # tags_arr = []
  # rand(1..4).times.each do
  #   ts = tags.sample
  #   tags_arr << ts unless tags_arr.include?(ts)
  # end
  # tags_arr.each do |t|
  #   Tagging.create(tag: t, taggable: medium)
  # end
end
# users.each do |user|
#   tags_arr = []
#   rand(1..4).times.each do
#     ts = tags.sample
#     tags_arr << ts unless tags_arr.include?(ts)
#   end
#   tags_arr.each do |t|
#     Tagging.create(tag: t, taggable: user)
#   end
# end



#
#
# puts "Use #{super_user.email} and #{PASSWORD} for testing"
#
# tags = Tag.all
# # Seeding Taggings
# posts.each do |post|
#   rand(1..3).times.each do
#     Tagging.create(
#       post_id: posts.sample.id,
#       tag_id: tags.sample.id
#     )
#   end
# end
#
# taggings = Tagging.all
# puts "===================Create #{taggings.count} taggings====================="
