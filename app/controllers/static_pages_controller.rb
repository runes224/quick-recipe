# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @recipes = Recipe.all
  end

  def help; end

  def about; end

  def contact; end
end
