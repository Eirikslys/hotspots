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
5.times do
  User.create!(email: "#{c}mail@mail.com", password: "password")
  c += 1
end
puts User.all

# Generate locations, owndership by users is assigned randomly
puts "creating locations"
Location.create!(name:"A secret garden", user: User.all.sample, address: "Braakmakergaten 27", price: "299$", description:"Enact a romantic rendesvouz or dramatic meeting in our wellkept walled garden, complete with statues")
Location.create!(name:"Cocaine mansion with great view", user: User.all.sample, address: "High street 477", price: "349$", description:"A mini-palace almost tastefully with authentic Chinese marble. Enact your scarface fantasy here")
Location.create!(name:"Cozy cabin", user: User.all.sample, address: "Timber Road 4228", price: "120$", description:"This solid lumber cabin, built in 1932, will give your pictures a homely and rustique feel. Inquire for snowscooter rental.")
puts Location.all

# Creating a rental for the last location
puts "creating a rental"
Rental.create(location: Location.last, user: Location.last.user)
puts Rental.all
