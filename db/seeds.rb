puts "🌱 Seeding database..."

# Avoid destructive operations in production
if Rails.env.development? || Rails.env.test?
  puts "Cleaning database..."
  Booking.destroy_all
  Car.destroy_all
  Service.destroy_all
  User.destroy_all
end

puts "Creating test user..."

user = User.find_by(id: 1)

unless user
  user = User.create!(
    id: 1,
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password'
  )
end

puts "Creating cars..."
cars_data = [
  { make: 'Toyota', model: 'Corolla', rego: 'ABC123' },
  { make: 'Honda', model: 'Civic', rego: 'DEF123' },
  { make: 'Mazda', model: '3', rego: 'GHI123' },
  { make: 'Nissan', model: 'Leaf', rego: 'JKL123' },
  { make: 'Hyundai', model: 'i30', rego: 'MNO123' },
  { make: 'Tesla', model: 'Model 3', rego: 'PQR123' },
  { make: 'Ford', model: 'Focus', rego: 'STU123' }
]

cars = cars_data.map do |car_attrs|
  Car.find_or_create_by!(rego: car_attrs[:rego]) do |car|
    car.assign_attributes(car_attrs.merge(user_id: user.id))
  end
end

puts "Creating services..."
service_names = ["WOF", "Maintenance"]
services = service_names.map do |name|
  Service.find_or_create_by!(name: name)
end

puts "Creating bookings..."
Booking.find_or_create_by!(car: cars[0], service: services[0], date: Date.today + 1, user_id: user.id) do |b|
  b.status = "pending"
end

Booking.find_or_create_by!(car: cars[1], service: services[1], date: Date.today + 2, user_id: user.id) do |b|
  b.status = "confirmed"
end

puts "✅ Seeding complete!"
