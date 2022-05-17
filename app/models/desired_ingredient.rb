class DesiredIngredient < ApplicationRecord
  attr_reader :recipes

  belongs_to :finder

  validates :name, presence: true

  def recipes
    options = [
            "#{name} %",
            "#{name}s %",
            "#{name}s,%",
            "#{name},%",
            "% #{name} %",
            "% #{name}s %",
            "% #{name}s,%",
            "% #{name},%",
            "% #{name}s",
            "% #{name}"
          ]
    # regex_name = /(^|\s)#{name}($[\s,])/
    
    @recipes ||= Recipe.joins(:ingredients)
    .where(Ingredient.arel_table[:name].matches_any(options)).distinct
    # .where('ingredients.name ILIKE ?', regex_name).distinct
  end 
end
