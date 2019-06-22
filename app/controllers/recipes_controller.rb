class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @recipe.directions.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    @recipe.save!
    flash[:success] = 'Recipe created!'
    redirect_to root_path
  end

    private

    def recipe_params
      params.require(:recipe).permit(:name, :description, directions_attributes: [:number, :content])
    end
end
