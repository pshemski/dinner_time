class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :cooking_time
      t.integer :prep_time
      t.float :ratings
      t.references :cuisine, foreign_key: true
      t.references :category, foreign_key: true
      t.references :author, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
