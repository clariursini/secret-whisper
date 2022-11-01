# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
puts "Destroyed Users"
puts "Creatting Users"
  user1 = User.create!(email: "clari@gmail.com", password: "123456")
  user2 = User.create!(email: "nacho@gmail.com", password: "123456")
  user3 = User.create!(email: "ramiro@gmail.com", password: "123456")
  user4 = User.create!(email: "pedro@gmail.com", password: "123456")
puts "Created users"
