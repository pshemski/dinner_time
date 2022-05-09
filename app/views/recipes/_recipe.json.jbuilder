json.extract! recipe, :id, :title, :cooking_time, :prep_time, :ratings, :cuisine_id, :category_id, :author_id, :image, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
