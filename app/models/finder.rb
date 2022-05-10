class Finder < ApplicationRecord
  has_many :desired_ingredients

  def all_recipes
    recipes_array = []
    desired_ingredients.each do |ingredient| 
      recipes_array << ingredient.recipes
    end
    recipes_array.flatten!
  end

  # recipes in order from most relevant to the least
  def recipes_data
    all_recipes.inject({}) do |hash, recipe|
      hash[recipe] ||= 0
      hash[recipe] += 1
      hash
    end.sort_by {|k, v| -v}
  end

  def most_relevant_recipes_only
    recipes_data.map { |data| data.first }
  end
end
