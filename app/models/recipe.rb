class Recipe < ApplicationRecord
  has_many :users, through: :myrecipes
  has_many :directions, dependent: :destroy
  has_many :ingredient_relations, dependent: :destroy
  has_many :ingredients, through: :ingredient_relations
end
