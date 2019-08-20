# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @recipes = Recipe.all.page(params[:page])
    @my_recipe = MyRecipe.new
  end
end
