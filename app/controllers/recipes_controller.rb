# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @ingredients = Ingredient.where("name LIKE(?)", "%#{params[:keyword]}%")
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @ingredient_relation = @recipe.ingredient_relations.build
    @direction = @recipe.directions.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    Rails::logger::debug(@recipe.errors.messages)
    @recipe.save!
    redirect_to root_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:id, :name, :description, :image, ingredient_relations_attributes: [:id, :recipe_id, :ingredient_id, :weight, :display_weight_name, :display_ingredient_name, :_destroy], directions_attributes: [:id, :number, :content, :_destroy])
  end

end
