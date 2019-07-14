Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/help',     to: 'static_pages#help'
  get  '/about',    to: 'static_pages#about'
  get  '/contact',  to: 'static_pages#contact'
  get  '/signup',   to: 'users#new'
  get  '/login',    to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'
  resources :sessions, only: [new]
  resources :users, [new create show edit update]
  resources :ingredients
  resources :recipes
  resources :ingredient_relations
end
