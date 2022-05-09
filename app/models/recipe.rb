class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :category
  belongs_to :author
  has_and_belongs_to_many :ingredients
end
