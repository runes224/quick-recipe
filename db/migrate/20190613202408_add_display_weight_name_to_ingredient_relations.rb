class AddDisplayWeightNameToIngredientRelations < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredient_relations, :display_weght_name, :string
  end
end
