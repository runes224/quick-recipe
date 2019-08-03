# frozen_string_literal: true

class Ingredient < ApplicationRecord
  has_many :ingredient_relations, dependent: :destroy, inverse_of: :ingredient
  has_many :recipes, through: :ingredient_relations
end
