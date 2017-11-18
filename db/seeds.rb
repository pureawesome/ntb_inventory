# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Brew.destroy_all
Sale.destroy_all

require 'faker'

20.times do
  Product.create(
    sku: Faker::Code.isbn,
    name: Faker::Name.first_name
  )
end

100.times do
  Brew.create(
    amount_full: Faker::Number.number(2),
    amount_sample: Faker::Number.number(1),
    description: Faker::Company.catch_phrase,
    product_id: Product.order("RANDOM()").first.id,
    date: Faker::Date.between(1.year.ago, Date.today)
  )
end

100.times do
  Sale.create(
    amount_full: Faker::Number.number(2),
    amount_sample: Faker::Number.number(1),
    paid: Faker::Boolean.boolean(0.8),
    description: Faker::Company.catch_phrase,
    product_id: Product.order("RANDOM()").first.id,
    date: Faker::Date.between(1.year.ago, Date.today)
  )
end
