class CreateFinders < ActiveRecord::Migration[5.2]
  def change
    create_table :finders do |t|

      t.timestamps
    end
  end
end
