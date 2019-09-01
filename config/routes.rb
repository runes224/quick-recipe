# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users
  get 'users/:id', to: 'users#show', as: 'user'
  get 'my_recipes', to: 'my_recipes#index'

  resources :recipes do
    resources :my_recipes, only: %i[create destroy]
  end
end
