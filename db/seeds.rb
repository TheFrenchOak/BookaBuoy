# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# require 'open-uri'
toto = User.new(email: "g.caasile@gmail.com", password: "123456789")
url = 'https://res.cloudinary.com/dposbbt0s/image/upload/v1558702915/n4ydevkbbeptimb2ul11.jpg'

puts "Creating 20 buoys ..."
20.times do
  buoy = Buoy.create!(
    name: Faker::Superhero.name,
    remote_photo_url: url,
    color: Faker::Color.color_name,
    size: Buoy::SIZE.sample,
    category: Buoy::CATEGORY.sample,
    price: (1..15).to_a.sample,
    address: Faker::Address.city,
    description: Faker::Lorem.sentence,
    user: toto
  )
  puts "created buoy : #{buoy.name}"
end



