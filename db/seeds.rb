# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require "json"
# require "rest-client"

# response = RestClient.get "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
# repos = JSON.parse(response)
# repos.size

require 'faker'
puts "destroying previous seed"
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

# puts "creating ingredients"
# Ingredient.create!(name: "lemon")
# Ingredient.create!(name: "ice")
# Ingredient.create!(name: "mint leaves")

# puts "creating cocktails"
# Cocktail.create!(name: "Tata")
# Cocktail.create!(name: "Toto")

puts "creating seed"
20.times do
  Dose.create!(
    description: Faker::Measurement.volume,
    cocktail: Cocktail.create!(name: Faker::Name.unique.name),
    ingredient: Ingredient.create!(name: Faker::Food.unique.ingredient)
  )
end

# puts "Create ingredients"
# url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
# ingredients = JSON.parse(open(url).read)
# ingredients["drinks"].each do |ingredient|
#   Dose.create!(
#   description: '4cl',
#   cocktail: Cocktail.find_by(name: "Toto"),
#   ingredient: Ingredient.create(name: ingredient["strIngredient1"])
# )
#   puts "create #{i.name}"
# end

puts "finished"
