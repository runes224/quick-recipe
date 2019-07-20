# frozen_string_literal: true

class AddDisplayIngredientNameToIngredientRelations < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredient_relations, :display_ingredient_name, :string
  end
end
