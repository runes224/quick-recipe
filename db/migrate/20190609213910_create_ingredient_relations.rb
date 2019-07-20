# frozen_string_literal: true

class CreateIngredientRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_relations do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
      t.float :weight

      t.timestamps
    end
  end
end
