class DesiredIngredient < ApplicationRecord
  attr_reader :recipes

  belongs_to :finder

  validates :name, presence: true

  def recipes
    @recipes ||= Recipe.joins(:ingredients).where(Ingredient.arel_table[:name].matches("%#{name}%"))
  end
end
