# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

Cocktail.destroy_all
Ingredient.destroy_all

puts 'Seeding ingredients...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

ingredients_json = open(url).read
ingredients = JSON.parse(ingredients_json)

ingredients['drinks'].each do |e|
  Ingredient.create(name: e['strIngredient1'])
end

puts 'Finished'

file_cocktail_1 = URI.open('https://cde.peru.com//ima/0/1/7/1/1/1711304/924x530/machu-picchu.jpg')
cocktail_1 = Cocktail.create!(name: 'machu picchu')
cocktail_1.photo.attach(io: file_cocktail_1, filename: 'machu_picchu.jpg', content_type: 'image/jpg')
cocktail_1.save
