# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

User.destroy_all
puts "Destroyed Users"

puts "Creatting Users"
user1 = User.new(email: "clari@gmail.com", password: "123456", name: "Clari", age: 34, description: "I love dogs")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U03PQPPGXUG-abbe6fa51dcc-512")
user1.photo.attach(io: file, filename: "clari.png", content_type: "image/png")
user1.save!

user2 = User.new(email: "nacho@gmail.com", password: "123456", name: "Nacho", age: 27, description: "I love programming")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U03NVDNP02Z-8e39c56cb377-512")
user2.photo.attach(io: file, filename: "nacho.png", content_type: "image/png")
user2.save!

user3 = User.new(email: "sofi@gmail.com", password: "123456", name: "Sofi", age: 32, description: "I love to travel")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U03NNS0RVHV-360467752b45-512")
user3.photo.attach(io: file, filename: "sofi.png", content_type: "image/png")
user3.save!

user4 = User.new(email: "pedro@gmail.com", password: "123456", name: "Pedro", age: 25, description: "I love cars")
file = URI.open("https://ca.slack-edge.com/T02NE0241-USKLA4JSG-b4bc4a5daadb-512")
user4.photo.attach(io: file, filename: "sofi.png", content_type: "image/png")
user4.save!

puts "Created users"
