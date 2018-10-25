# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

15.times do
  City.create(name: Faker::Address.city)
end


30.times do
  Doctor.create(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, postal_code: Faker::Address.postcode, city_id: rand(15))
end

50.times do
  Patient.create(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, city_id: rand(15))
end

@spe = ["Cardiologue", "Endocrinologue", "ORL", "Psychiatre", "Dentiste", "Gynécologue", "Généraliste", "Urologue", "Pneumologue", "Neurochirurgien", "Rhumatologue", "Dermatologue", "Pédiatre", "Addictologue"]
@spe.each do |i|
  Specialty.create(name: i)
end

60.times do
  Appointment.create(date: Faker::Date.forward(200).to_datetime, doctor_id: rand(30), patient_id: rand(50), city_id:rand(15))
end

for i in (1..Doctor.all.count)
  Specialty.find(rand(1..14)).doctors << Doctor.find(i)
end

for i in (1..Specialty.all.count)
  Doctor.find(rand(1..14)).specialties << Specialty.find(i)
end
