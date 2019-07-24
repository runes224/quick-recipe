# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  get  '/help',     to: 'static_pages#help'
  get  '/about',    to: 'static_pages#about'
  get  '/contact',  to: 'static_pages#contact'
  get  '/login',    to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  resources :users, only: %i[create show destroy] do
    resources :myrecipes, only: %i[create destroy]
  end
  resources :recipes, only: %i[new create show update destroy] do
    resources :ingredient_relations, only: %i[create destroy]
    resources :directions, only: %i[create destroy update]
  end
end
