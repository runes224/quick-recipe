# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  get 'users/:id', to: 'users#show', as: 'user'
  get 'my_recipes', to: 'my_recipes#index'

  resources :recipes, only: %i[index new create show edit update destroy] do
    resources :ingredient_relations, only: %i[create destroy]
    resources :directions, only: %i[create destroy update]
    resources :my_recipes, only: %i[create destroy]
  end
end
