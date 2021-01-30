# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating wigs"

@images = Dir.glob("app/assets/images/wigs/*.jpg")
counter = 0
@images.each do |image|
  counter = counter + 1
  puts "creating wig # #{counter}"
  new_wig = Wig.new(user_id: 1, name: "Wig Example ##{counter}", description: "This is where you tell more about the wig", color: "Existing color", material:"Natural/Plastic...", style: "Wavy/Straight...")
  puts new_wig.name
  new_wig.save
  # Trying to assign uploaded picture to wig model. Need to find how to get the 'key' information to assign to wig.photo.key)
  #wig_counter = wig_counter - 1
  # new_wig.photo.key = wig_cl_img[wig_counter]
  # puts new_wig.photo.key
end