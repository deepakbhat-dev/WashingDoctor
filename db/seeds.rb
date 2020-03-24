# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

services = [
  { service_name: 'Body Wash', car_size: 'Hatchback', price: '150', description: 'Body Wash' },
  { service_name: 'Full Wash', car_size: 'Hatchback', price: '250', description: 'Full Wash' },
  { service_name: 'Body Wash', car_size: 'Sedan', price: '300', description: 'Body Wash' },
  { service_name: 'Full Wash', car_size: 'Sedan', price: '400', description: 'Full Wash' },
  { service_name: 'Body Wash', car_size: 'SUV', price: '450', description: 'Body Wash' },
  { service_name: 'Full Wash', car_size: 'SUV', price: '550', description: 'Full Wash' },
]

services.each do |service|
  Service.create!(service)
end
