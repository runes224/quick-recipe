# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :my_recipes
  has_many :added_recipes, through: :my_recipes, source: :user
  has_many :directions, -> {order('number ASC')}, dependent: :destroy, inverse_of: :recipe
  has_many :ingredient_relations, dependent: :destroy, inverse_of: :recipe
  has_many :ingredients, through: :ingredient_relations

  accepts_nested_attributes_for :directions, allow_destroy: true
  accepts_nested_attributes_for :ingredient_relations, allow_destroy: true

  validates :name, presence: true, length: { maximum: 50 }
  validates :image, presence: true
  mount_uploader :image, ImageUploader

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end

  def self.ransackable_assotiations(auth_object = nil)
    %w[ingredients]
  end

end
