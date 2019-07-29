# frozen_string_literal: true

class UsersController < ApplicationController
  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end
end
