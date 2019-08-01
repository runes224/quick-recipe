# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @recipes = Recipe.all.page(params[:page])
  end

  def help; end

  def about; end

  def contact; end
end
