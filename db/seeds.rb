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
user1 = User.new(email: "clari@gmail.com", password: "123456", name: "Clari", age: 34, description: "I love dogs", gender: "Female", interests: "Male", bar_code: 1)
file = URI.open("https://ca.slack-edge.com/T02NE0241-U03PQPPGXUG-abbe6fa51dcc-512")
user1.photo.attach(io: file, filename: "clari.png", content_type: "image/png")
user1.save!

user2 = User.new(email: "nacho@gmail.com", password: "123456", name: "Nacho", age: 27, description: "I love programming", gender: "Male", interests: "Female",  bar_code: 1)
file = URI.open("https://ca.slack-edge.com/T02NE0241-U03NVDNP02Z-8e39c56cb377-512",)
user2.photo.attach(io: file, filename: "nacho.png", content_type: "image/png")
user2.save!

user3 = User.new(email: "sofi@gmail.com", password: "123456", name: "Sofi", age: 32, description: "I love to travel", gender: "Female", interests: "Male",  bar_code: 1)
file = URI.open("https://ca.slack-edge.com/T02NE0241-U03NNS0RVHV-360467752b45-512")
user3.photo.attach(io: file, filename: "sofi.png", content_type: "image/png")
user3.save!

user4 = User.new(email: "beni@gmail.com", password: "123456", name: "Beni", age: 28, description: "I love Lionel Messi", gender: "Male", interests: "Female",  bar_code: 2)
file = URI.open("https://ca.slack-edge.com/T02NE0241-U03NY6P9V52-c21424e32e07-512")
user4.photo.attach(io: file, filename: "beni.png", content_type: "image/png")
user4.save!

user5 = User.new(email: "piova@gmail.com", password: "123456", name: "Piova", age: 25, description: "I love Ford", gender: "Male", interests: "Male",  bar_code: 2)
file = URI.open("https://pps.whatsapp.net/v/t61.24694-24/165527265_263587749314606_7516529023045156188_n.jpg?ccb=11-4&oh=01_AdT7vxK7Ag14kidisUziZQpi40h6JRxA1K4w38R0rSarcA&oe=63768F94")
user5.photo.attach(io: file, filename: "piova.png", content_type: "image/png")
user5.save!

user6 = User.new(email: "man@gmail.com", password: "123456", name: "Man", age: 25, description: "I love Ford", gender: "Male", interests: "Female",  bar_code: 2)
file = URI.open("https://pps.whatsapp.net/v/t61.24694-24/56153890_2341045275926347_581404302610792448_n.jpg?ccb=11-4&oh=01_AdTaJJMMxO2vnLCae_CX9r4JcgajHEhPMmVi-dQAMswSbw&oe=6376A210")
user6.photo.attach(io: file, filename: "man.png", content_type: "image/png")
user6.save!

puts "Created users"
