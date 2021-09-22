Rails.application.routes.draw do
  
  resources :keywords
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  
  get "/bienvenida", to: "home#index"
  get "/search", to: "products#search"
  get "/category_search", to: "categories#search"

  resources:categories
  resources :stores
  #get "categories", to:"categories#index"
  #get "categories/new", to:"categories#new", as: :new_categories
  #get "categories/:id", to:"categories#show"
  #get "categories/:id/edit", to:"categories#edit"

  #patch "categories/:id", to:"categories#update", as: :category
  #post "categories", to:"categories#create"
  #delete "categories/:id", to:"categories#destroy"
end
