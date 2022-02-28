# Create a main sample user.
User.create!(name:  "Example User",
             email: "engineering-test@company.com",
             password:              "company",
             password_confirmation: "company",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

# Generate a bunch of additional users.
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

# Generate microposts for a subset of users.
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Create following relationships.
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

Relationship.all.find_each do |r|
  new_time = Time.zone.now - rand(1.year)
  r.update_columns(updated_at: new_time, created_at: new_time)
end

# Simulate Samy Worm
samy = User.all.order("RANDOM()").first
samy.update(name: "Samy Kamkar",
             email: "everyones-hero@company.com",
             password: "SamyWorm2005",
             password_confirmation: "SamyWorm2005")
User.where.not(email: "everyones-hero@company.com").find_each do |user|
  user.follow(samy) unless user.following? samy
end

