class MyRecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    # @recipes = Recipe.joins(:my_recipes).where(my_recipes: { user_id: current_user.id }).page(params[:page])
    @q = Recipe.joins(:my_recipes).where(my_recipes: { user_id: current_user.id }).ransack(params[:q])
    @recipes = @q.result(distinct: true)
                 .page(params[:page])
  end

  def create
    @my_recipe = current_user.my_recipes.create(recipe_id: params[:recipe_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @my_recipe = MyRecipe.find_by(recipe_id: params[:recipe_id], user_id: current_user.id)
    @my_recipe.destroy
    redirect_back(fallback_location: root_path)
  end
end
