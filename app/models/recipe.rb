# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :users, through: :myrecipes
  has_many :directions, -> {order('number ASC')}, dependent: :destroy, inverse_of: :recipe
  accepts_nested_attributes_for :directions, allow_destroy: true
  has_many :ingredient_relations, dependent: :destroy, inverse_of: :recipe
  has_many :ingredients, through: :ingredient_relations
  accepts_nested_attributes_for :ingredient_relations, allow_destroy: true
  validates :name, presence: true, length: {maximum: 50}
  mount_uploader :image, ImageUploader
end
