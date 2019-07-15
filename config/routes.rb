Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/help',     to: 'static_pages#help'
  get  '/about',    to: 'static_pages#about'
  get  '/contact',  to: 'static_pages#contact'
  get  '/login',    to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  resources :users, only: [:create, :show, :destroy]
  resources :recipes, only: [:new, :create, :show, :update, :destroy]
  resources :ingredients, only: [:create, :update, :destroy]
  resources :ingredient_relations, only: [:create, :destroy]
  resources :myrecipes, only: [:create, :destroy]
end
