# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @created_recipes = Recipe.where(user_id: current_user.id).page(params[:page])
  end
end
