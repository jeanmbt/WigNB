require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Wig.destroy_all
User.destroy_all

wig_urls = ["https://res.cloudinary.com/det3cfeuo/image/upload/v1611951779/122188981_381209123235477_6078118770236452520_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951778/83648363_153345072933573_1780315991930769335_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951777/120071059_322069665726364_6643220649883490748_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951776/ejxuatty7muz.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951775/118821937_1301871646654638_3649253308342502856_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951774/128147649_2732317226983359_8253060199056238589_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951773/141598262_732850230952028_1839645511739517442_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951770/140375754_172082167999419_3637993603317197526_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951769/104058028_888371534999764_2911223772971798150_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951768/121663677_357675018981276_3907510190854830877_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951767/136415408_1320229914999116_1095840898989377710_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951765/123943254_355998089011459_5982987040773507141_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951764/horns.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951763/130160179_110978374191987_7007545978336118191_n.jpg", "https://res.cloudinary.com/det3cfeuo/image/upload/v1611951762/136062878_150758336620787_1797297913793010095_n.jpg"]

puts "create user"
new_user = User.new(email: "email@email.com", password: "123456")
new_user.save

puts "Creating wigs"

# @images = Dir.glob("app/assets/images/wigs/*.jpg")
counter = 0
wig_urls.each do |wig_url|
  file = URI.open(wig_url)
  counter = counter + 1
  puts "creating wig # #{counter}"
  new_wig = Wig.new(user_id: new_user.id, name: "Wig Example ##{counter}", description: "This is where you tell more about the wig", color: "Existing color", material:"Natural/Plastic...", style: "Wavy/Straight...")
  new_wig.photo.attach(io: file, filename: new_wig.name, content_type: "image/png")
  puts new_wig.name
  new_wig.save
  # Trying to assign uploaded picture to wig model. Need to find how to get the 'key' information to assign to wig.photo.key)
  #wig_counter = wig_counter - 1
  # new_wig.photo.key = wig_cl_img[wig_counter]
  # puts new_wig.photo.key
end