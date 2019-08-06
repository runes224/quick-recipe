# frozen_string_literal: true

class IngredientRelation < ApplicationRecord
  belongs_to :recipe, inverse_of: :ingredient_relations
  belongs_to :ingredient, inverse_of: :ingredient_relations
  validates :weight, presence: true
end
