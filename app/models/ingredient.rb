class Ingredient < ApplicationRecord
  has_many :ingredient_relations, dependent: :destroy
  has_many :recipes, through: :ingredient_relations
end
