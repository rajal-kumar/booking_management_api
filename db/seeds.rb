# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Booking.destroy_all
Car.destroy_all
Service.destroy_all
User.destroy_all

puts "Creating test user..."
user = User.create!(
  id: 1,
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password'
)

puts "Creating cars..."
cars = Car.create!([
  { make: 'Toyota', model: 'Corolla', rego: 'ABC123', user_id: user.id },
  { make: 'Honda', model: 'Civic', rego: 'DEF123', user_id: user.id },
  { make: 'Mazda', model: '3', rego: 'GHI123', user_id: user.id },
  { make: 'Nissan', model: 'Leaf', rego: 'JKL123', user_id: user.id },
  { make: 'Hyundai', model: 'i30', rego: 'MNO123', user_id: user.id },
  { make: 'Tesla', model: 'Model 3', rego: 'PQR123', user_id: user.id },
  { make: 'Ford', model: 'Focus', rego: 'STU123', user_id: user.id }
])

puts "Creating services..."
services = Service.create!([
  { name: "WOF" },
  { name: "Maintenance" }
])

puts "Creating bookings..."
Booking.create!([
  { car: cars[0], service: services[0], date: Date.today + 1, status: "pending", user_id: user.id },
  { car: cars[1], service: services[1], date: Date.today + 2, status: "confirmed", user_id: user.id }
])

puts "Seeding complete!"
