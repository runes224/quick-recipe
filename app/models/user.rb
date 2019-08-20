class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :my_recipes, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :added_recipes, through: :my_recipes, source: :recipe

  def already_liked?(recipe)
    self.my_recipes.exists?(recipe_id: recipe.id)
  end
end
