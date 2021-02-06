require "open-uri"
require 'faker'
require 'pry-byebug'
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

wig_urls = ["https://res.cloudinary.com/det3cfeuo/image/upload/v1611951779/122188981_381209123235477_6078118770236452520_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951778/83648363_153345072933573_1780315991930769335_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951777/120071059_322069665726364_6643220649883490748_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951776/ejxuatty7muz.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951775/118821937_1301871646654638_3649253308342502856_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951774/128147649_2732317226983359_8253060199056238589_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951773/141598262_732850230952028_1839645511739517442_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951770/140375754_172082167999419_3637993603317197526_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951769/104058028_888371534999764_2911223772971798150_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951768/121663677_357675018981276_3907510190854830877_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951767/136415408_1320229914999116_1095840898989377710_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951765/123943254_355998089011459_5982987040773507141_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951764/horns.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951763/130160179_110978374191987_7007545978336118191_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951762/136062878_150758336620787_1797297913793010095_n.jpg"]

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

