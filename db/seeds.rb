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

puts "Creating 50 buoys ..."
50.times do
  buoy = Buoy.create!(
    name: Faker::Name.name,
    photo: 'https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiK-u-CgLLiAhVjxYUKHahQCJUQjRx6BAgBEAU&url=%2Furl%3Fsa%3Di%26source%3Dimages%26cd%3D%26ved%3D%26url%3Dhttps%253A%252F%252Fwww.aliexpress.com%252Fitem%252FGiant-Flamingo-Swimming-Ring-120cm-Inflatable-Mattress-Float-Mat-Air-Buoy-Swim-Circle-Beach-Water-Game%252F32799215286.html%26psig%3DAOvVaw14vx-Kq5TB9YCgBQhYlKzh%26ust%3D1558712844793568&psig=AOvVaw14vx-Kq5TB9YCgBQhYlKzh&ust=1558712844793568',
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



