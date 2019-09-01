# frozen_string_literal: true

class IngredientRelation < ApplicationRecord
  belongs_to :recipe, inverse_of: :ingredient_relations
  belongs_to :ingredient, inverse_of: :ingredient_relations
  validates :recipe, presence: true
  validates :weight, presence: true, length: {maximum: 7}
  validates :display_weight_name, presence: true, length: {maximum: 20}
  validates :display_ingredient_name, presence: true, length: {maximum: 20}
end
    