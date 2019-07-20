# frozen_string_literal: true

class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @ingredient_relation = IngredientRelation.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    @recipe.save!
    session[:recipe_id] = @recipe.id
    redirect_to new_ingredient_relation_path
  end

  private

  def recipe_params
    # params.require(:recipe).permit(:name, :description, directions_attributes: [:number, :content])

    # params.require(:recipe).permit(:name, :description, ingredient_relations_attributes: [:weight, :display_weight_name, :display_ingredient_name])

    params.require(:recipe).permit(:name, :description)
  end
end
