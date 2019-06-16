class AddDisplayWeightNameToIngredientRelations < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredient_relations, :display_we_nameght_name, :string
  end
end
