# frozen_string_literal: true

class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    # @query = Ingredient.ransack(params[:q])
    # @ingredients = @query.result
    # if params[:q].present?
    #   render json:  @articles.select("name").map { |e| e.title  }.to_json
    # end
    @recipe = Recipe.new
    @ingredient_relation = @recipe.ingredient_relations.build
    @direction = @recipe.directions.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.valid?
    Rails::logger::debug(@recipe.errors.messages)
    @recipe.save!
    redirect_to root_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:id, :name, :description, :image, ingredient_relations_attributes: [:id, :recipe_id, :ingredient_id, :weight, :display_weight_name, :display_ingredient_name, :_destroy], directions_attributes: [:id, :number, :content, :_destroy])
  end

end
