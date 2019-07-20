# frozen_string_literal: true

class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :group
      t.float :calorie
      t.float :carbohydrate
      t.float :protein
      t.float :lipid
      t.float :salt

      t.timestamps
    end
  end
end
