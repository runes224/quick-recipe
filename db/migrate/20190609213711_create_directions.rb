# frozen_string_literal: true

class CreateDirections < ActiveRecord::Migration[5.2]
  def change
    create_table :directions do |t|
      t.integer :recipe_id
      t.integer :number
      t.string :content

      t.timestamps
    end
  end
end
