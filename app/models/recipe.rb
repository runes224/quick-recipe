# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :users, through: :myrecipes
  has_many :directions, -> { order('number ASC') }, dependent: :destroy
  accepts_nested_attributes_for :directions
  has_many :ingredient_relations, dependent: :destroy
  has_many :ingredients, through: :ingredient_relations
  validates :name, presence: true, length: {maximum: 50}
  mount_uploader :image, ImageUploader
end
