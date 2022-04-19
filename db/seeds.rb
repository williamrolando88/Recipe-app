# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Create 5 random users
(1..5).each do |i|
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )
end

# Create 50 random recipes for random users
(1..50).each do |i|
  Recipe.create!(
    name: Faker::Food.unique.dish,
    preparation_time: rand(1..10),
    cooking_time: rand(1..10),
    description: Faker::Food.description,
    public: [true, false].sample,
    user_id: rand(1..5)
  )
end

# Create 10 random foods for random users
(1..10).each do |i|
  Food.create!(
    name: Faker::Food.unique.ingredient,
    measurement_unit: Faker::Food.metric_measurement,
    price: rand(0.01..100.00),
    user_id: rand(1..5)
  )
end
