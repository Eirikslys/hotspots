# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# before seeding it wipes out database entries.
puts "deleting rentals"
 Rental.destroy_all
puts "rentals destroyed"

puts "deleting locations"
 Location.destroy_all
puts "locations destroyed"

puts "deleting users"
 User.destroy_all
puts "users destroyed"

# Generate some users, they are identical but with a number from 1 to 5 before their email.
puts "creating users"
c = 1
u = User.new(email: "mail@mail.com", password: "password")
u.save!
p u
4.times do
  User.create!(email: "#{c}mail@mail.com", password: "password")
  c += 1
end

puts User.all

# Generate locations, owndership by users is assigned randomly
puts "creating locations"
file = File.open("app/assets/images/garden.jpg")
Location.create!(name:"A secret garden", user: User.all.sample, address: "Karl Johans gate 12", price: "299$", description:"Enact a romantic rendesvouz or dramatic meeting in our wellkept walled garden, complete with statues")
loc = Location.last
loc.photo.attach(io: file, filename: 'garden.jpg', content_type: 'image/png')
Location.create!(name:"Mansion", user: User.all.sample, address: "High street 477", price: "349$", description:"A mini-palace almost tastefully executed with authentic Chinese marble. Live out your scarface fantasy here")
file = File.open("app/assets/images/mansion.jpg")
loc = Location.last
loc.photo.attach(io: file, filename: 'mansion.jpg', content_type: 'image/png')

Location.create!(name:"Cozy cabin", user: u, address: "Timber Road 4228", price: "120$", description:"This solid lumber cabin, built in 1932, will give your pictures a homely and rustique feel. Inquire for snowscooter rental.")
file = File.open("app/assets/images/cabin.jpg")
loc = Location.last
loc.photo.attach(io: file, filename: 'cabin.jpg', content_type: 'image/png')

Location.create!(name:"Modest home", user: User.all.sample, address: "Example alley 771", price:"99$", description: "Get the authentic crack den experience that only a real crack den offers! Only available for a limited period!")
file = File.open("app/assets/images/den.jpg")
loc = Location.last
loc.photo.attach(io: file, filename: 'den.jpg', content_type: 'image/png')

puts Location.all

# Creating a rental for the last location
# puts "creating a rental"
# Rental.create(location: Location.last, user: Location.last.user)
# puts Rental.all
