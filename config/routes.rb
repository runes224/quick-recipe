# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users
  resources :users, only: %i[show]
  resources :my_recipes, only: %i[index]

  resources :recipes do
    resources :my_recipes, only: %i[create destroy]
  end
end
