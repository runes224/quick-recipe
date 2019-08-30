# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @q = current_user.recipes.ransack(params[:q])
    @recipes = @q.result(distinct: true)
                 .page(params[:page])
  end
end
