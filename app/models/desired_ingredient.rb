class DesiredIngredient < ApplicationRecord
  belongs_to :finder

  def recipes
    Recipe.joins(:ingredients).where(Ingredient.arel_table[:name].matches("%#{name}%"))
  end
end
