# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    # @recipes = Recipe.all.page(params[:page])
    # @my_recipe = MyRecipe.new
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true)
                 .page(params[:page])
  end
end
