class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :category
  belongs_to :author
end
