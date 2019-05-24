require 'faker'

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





