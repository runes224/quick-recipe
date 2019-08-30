# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true)
                 .page(params[:page])
  end
end
