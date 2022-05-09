# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

file = File.read(Rails.root.join('lib', 'seeds', 'recipes-en.json'))
recipes = JSON.parse(file)

recipes.each do |recipe|
  ingredients = recipe['ingredients']
  author = Author.find_or_create_by(name: recipe['author'])
  category = Category.find_or_create_by(name: recipe['category'])
  cuisine = Cuisine.find_or_create_by(name: recipe['cuisine'])
  recipe = Recipe.create(
    title: recipe['title'],
    cooking_time: recipe['cook_time'],
    prep_time: recipe['prep_time'],
    ratings: recipe['ratings'],
    cuisine: cuisine,
    category: category,
    author: author,
    image: recipe['image']
  )
  ingredients.each do |ing|
    ingredient = Ingredient.find_or_create_by(name: ing)
    recipe.ingredients << ingredient
  end
end