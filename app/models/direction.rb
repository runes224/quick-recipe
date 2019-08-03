# frozen_string_literal: true

class Direction < ApplicationRecord
  belongs_to :recipe, optional: true, inverse_of: :directions
  validates :number, presence: true
  validates :content, presence: true
end
