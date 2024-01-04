# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Generate 100 fake users
100.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 10),
    admin: [true, false].sample
  )
end

# Fetch all user IDs who don't have a review yet
user_ids = User.left_outer_joins(:reviews).where(reviews: { user_id: nil }).pluck(:id)
movie_ids = Movie.pluck(:id)

# Generate a fake review for each user who doesn't have one yet
user_ids.each do |user_id|
  Review.create!(
    recommendation: [true, false].sample,
    user_id: user_id,
    movie_id: movie_ids.sample,
    integer: Faker::Number.number(digits: 5).to_s
  )
end