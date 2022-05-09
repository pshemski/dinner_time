class CreateDesiredIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :desired_ingredients do |t|
      t.string :name
      t.references :finder, foreign_key: true

      t.timestamps
    end
  end
end
