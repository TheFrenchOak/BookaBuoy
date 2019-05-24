# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
toto = User.new(email: "g.caasile@gmail.com", password: "123456789")
diane = User.new(email: "diane.deesse@hotmail.fr", password: "987654321")

buoys_urls = [
  "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwiRp9OGgLTiAhWKDxQKHdCVA64QjRx6BAgBEAU&url=https%3A%2F%2Fwww.amazon.fr%2FGonflable%25EF%25BC%258CBou%25C3%25A9e-Gonflable-Innoo-Tech-Sp%25C3%25A9ciales%2Fdp%2FB079NR67R3&psig=AOvVaw2prfiWOsZbHf_NthWILJKF&ust=1558781582718957",
  "https://www.google.com/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwiWwNr-gLTiAhWs6uAKHQ6yCeUQjRx6BAgBEAU&url=%2Furl%3Fsa%3Di%26source%3Dimages%26cd%3D%26ved%3D%26url%3Dhttps%253A%252F%252Fwww.beausoleil.co%252Fproducts%252Fbouee-licorne-geante-joanna%26psig%3DAOvVaw2prfiWOsZbHf_NthWILJKF%26ust%3D1558781582718957&psig=AOvVaw2prfiWOsZbHf_NthWILJKF&ust=1558781582718957",
  "https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.bananair.fr%2F1469%2Fbouee-pizza.jpg&imgrefurl=https%3A%2F%2Fwww.bananair.fr%2Ffr%2Fjardinpiscine%2F316-bouee-pizza-4029811358250.html&docid=RFwkYS7uXwYQ1M&tbnid=1sF8Ag1rY0LF6M%3A&vet=10ahUKEwiP55yFgLTiAhUNdBQKHaEQDB4QMwjaASgGMAY..i&w=850&h=850&bih=981&biw=1853&q=bou%C3%A9e&ved=0ahUKEwiP55yFgLTiAhUNdBQKHaEQDB4QMwjaASgGMAY&iact=mrc&uact=8",
]

puts "Creating buoys ..."
buoys_urls.each do |buoy_photo_url|
  buoy = Buoy.new(
    name: Faker::Name.name,
    color: Faker::Color.color_name,
    size: Buoy::SIZE.sample,
    category: Buoy::CATEGORY.sample,
    price: (1..15).to_a.sample,
    address: Faker::Address.city,
    description: Faker::Lorem.sentence,
    user: toto
   )

  url = buoy_photo_url
  buoy.remote_photo_url = url
  buoy.save!
  puts "created buoy : #{buoy.name}"
  booking = Booking.new(start_date: '2015-02-02', end_date: '2015-02-08')
  booking.user = diane
  booking.buoy = buoy
  booking.save!
  end




