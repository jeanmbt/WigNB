require "open-uri"
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "\n \n ///////////////////////////////////////////////////////"
puts "/////////////seed starts// ///////////////////////////"
puts "///////////////////////////////////////////////////////"

Booking.destroy_all
Wig.destroy_all
User.destroy_all

wig_urls = ["https://images-na.ssl-images-amazon.com/images/I/510696lNE9L._SY500_.jpg", "https://variety.com/wp-content/uploads/2018/08/variety_artisans_rupaul_hair_tn_04.jpg?w=681&h=383&crop=1", "https://i.pinimg.com/236x/e4/3f/cb/e43fcb9501d124fc6c6569fc5995d64e--high-hair-wigs.jpg", "http://www.akwigdesigns.com/uploads/1/1/6/7/116731363/s529027093956812402_p5_i2_w1920.jpeg?width=640", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREf_ttRR8fWGy9B9zrcAaukQsnGEBOa0JSXw&usqp=CAU", "https://cdn.shopify.com/s/files/1/0037/6268/3953/products/image_fae41c59-18df-4ddc-8932-0b016afdf675_1024x1024@2x.jpg?v=1614986873", "https://assets.rbl.ms/5517191/980x.jpg", "https://thephagshop.com/wp-content/uploads/thePHAGshop_Foam-BIG-Diva-Wig-Purple.jpg", "https://live.staticflickr.com/2241/5708530540_0f9e7d84cb_z.jpg", "https://541039-1731181-raikfcquaxqncofqfm.stackpathdns.com/3986-home_default/wig-large-bow.jpg", "https://cdn.shopify.com/s/files/1/0037/6268/3953/products/image_f63c0909-ec2b-4764-9a87-83179b56cd86_1024x1024@2x.jpg?v=1614986873", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZs4KJVKX04IhnMxO1hXxvmUdIxom74Va6yw&usqp=CAU", "https://i.pinimg.com/originals/55/9b/c0/559bc0884658f43055cd3deb57e76714.jpg", "https://media1.popsugar-assets.com/files/thumbor/S7UdwU_13hpGpbOp7wutlvSgMpQ/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2018/02/22/804/n/1922283/1ebb8fac5a8f0977993d17.44571767_/i/RuPaul-Drag-Race-Season-10-Cast-Instagram-Twitter.jpg", "https://www.theluxuryspot.com/wp-content/uploads/2014/01/Screen-Shot-2014-01-17-at-11.31.51-AM.png"]

puts " \n \n "
new_user = User.new(email: "user@email.com", password: "123456")
new_user.save
puts "💃 Created dummy user: \n email: #{new_user.email} \n password: #{new_user.password} \n"
puts " \n \n "

new_user2 = User.new(email: "user2@email.com", password: "123456")
new_user2.save
puts "💃 Created another dummy user: \n email: #{new_user2.email} \n password: #{new_user2.password}"
puts " \n \n "


admin = User.new(email: "admin@wignb.com", password: "000000")
admin.admin = true
admin.save
puts "🔑🔑 Created admin user: \n email: #{admin.email} \n password: #{admin.password} \n"
puts " \n \n "


def wig_name_generator
  randomize = []
  10.times do
    possibilities = [ Faker::Name.female_first_name, Faker::Demographic.marital_status, Faker::Cosmere.shard, Faker::Cosmere.metal, Faker::Cosmere.knight_radiant, Faker::Creature::Animal.name, Faker::Games::Pokemon.name, Faker::TvShows::GameOfThrones.house ].sample
    possibilities_two = [ Faker::Name.female_first_name, Faker::Demographic.marital_status, Faker::Cosmere.shard, Faker::Cosmere.metal, Faker::Cosmere.knight_radiant, Faker::Creature::Animal.name, Faker::Games::Pokemon.name, Faker::TvShows::GameOfThrones.house ].sample
    randomize << possibilities
    randomize << possibilities_two
  end
  "#{randomize.sample.capitalize} #{randomize.sample.capitalize}"
end

def style_generator
  style = ["straight", "bushy", "curly", "afro", "round", "stiff", "static", "wavy", "natural-looking"].sample(2)
  style.join(",")
end

def material_generator
  lace = ["front lace", "full lace", "full cap", "no lace"].sample
  material = ["plastic", "natural", "mixed", "wool"].sample
  material_generated = "#{lace}, #{material}"
  material_generated.to_s
end

def color_generator
  ["blue", "green", "yellow", "red", "blonde", "brown", "black", "deep brown", "neon yellow", "white", "ginger", "grey"].sample
end

puts "Creating wigs"

# @images = Dir.glob("app/assets/images/wigs/*.jpg")
counter = 0

wig_urls.each do |wig_url|
  
  file = URI.open(wig_url)
  counter = counter + 1
  puts "wig # #{counter}..."
  new_wig = Wig.new(user_id: new_user.id, name: wig_name_generator, description: "This is where you tell more about the wig", color: color_generator, material: "#{material_generator}", style: "#{style_generator}")
  new_wig.photo.attach(io: file, filename: new_wig.name, content_type: "image/png")
  new_wig.save
  puts "💅 wig created: #{new_wig.name}  \n "
end



puts "\n ///////////////////////////////////////////////////////"
puts "/////////////seed completed ///////////////////////////"
puts "///////////////////////////////////////////////////////"

