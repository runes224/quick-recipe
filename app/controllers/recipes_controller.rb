# frozen_string_literal: true

class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @ingredient_relation = @recipe.ingredient_relations.build
    @direction = @recipe.directions.build
  end

  def create
    # @ingredient_relation = @recipe.ingredient_relations.build
    # @direction = @recipe.directions.build
    @recipe = current_user.recipes.build(recipe_params)
    @recipe.save!
    redirect_to root_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :image, ingredient_relations_attributes: [:weight, :display_weight_name, :display_ingredient_name], directions_attributes: [:number, :content])
  end

end
