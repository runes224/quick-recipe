class CreateMyRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :my_recipes do |t|
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
