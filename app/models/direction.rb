class Direction < ApplicationRecord
  belongs_to :recipe
  validates :recipe_id, presence: true
  validates :number, presence: true
  validates :content, presence: true
end
