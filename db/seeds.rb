# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
# 5.times do |i|
#   user = User.offset(rand(User.count)).first
#   post = Post.create(title: "Post ##{i}", url: "https://example.com", user: user, score: rand(100))
#   parent = Comment.create(post: post, user: user, body: "commment ##{i}", score: rand(100))
#   rand(10).times do |j|
#     Comment.create(post: post, user: user, body: "reply comment ##{j}", parent: parent, score: rand(100))
#   end
# end
#
5.times do |i|
  User.create(name: "User##{i}", password: 'secret', email: "user#{i}@example.com", karma: rand(100), about: "about me")
end

25.times do |i|
  user = User.offset(rand(User.count)).first
  post = Post.create(title: "Post ##{i}", url: 'https://example.com',
                     score: rand(100), user: user)

  (1 + rand(5)).times do |i|
    user = User.offset(rand(User.count)).first
    Comment.create(post: post, user: user, body: "comment ##{i}", score: rand(100))
  end

end

50.times do |i|
  user = User.offset(rand(User.count)).first
  parent = Comment.offset(rand(Comment.count)).first
  Comment.create(post: parent.post, user: user, body: "subcomment ##{i}", score: rand(100), parent_id: parent.id)
end

User.create(name: "admin", password: 'admin', email: "admin@localhost", account_type: 'admin')
