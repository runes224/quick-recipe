# frozen_string_literal: true

class IngredientRelationsController < ApplicationController
  before_action :authenticate_user!

  def create
    # user_params = params.permit(:name, :email)
    @recipe = Recipe.find_by(id: session[:recipe_id])
    @ingredient_relation = @recipe.ingredient_relations.build(ingredient_relation_params)
    @ingredient_relation.save
    render json: @ingredient_relation
  end

  private

  def ingredient_relation_params
    params.permit(:ingredient_id, :weight, :display_weight_name, :display_ingredient_name)
  end
end
