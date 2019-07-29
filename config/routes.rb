# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  get 'users/:id', to: 'users#show'
  # resources :users, only: %i[create show destroy] do
  #   resources :myrecipes, only: %i[create destroy]
  # end
  resources :recipes, only: %i[new create show update destroy] do
    resources :ingredient_relations, only: %i[create destroy]
    resources :directions, only: %i[create destroy update]
  end
end
