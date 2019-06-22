class Direction < ApplicationRecord
  belongs_to :recipe, optional: true
  validates :number, presence: true
  validates :content, presence: true
end
