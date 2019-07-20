# frozen_string_literal: true

class IngredientRelation < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  validates :ingredient_id, presence: true
  validates :recipe_id, presence: true
  validates :weight, presence: true
end
