# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'recipes#index'

  resources :foods, except: [:update]

  resources :users, only: %i[index show] do
    resources :recipes, only: %i[index show new create destroy] do
      resources :recipe_foods, only: %i[index new create destroy]
    end
    resources :foods, only: %i[index new create]
  end

  get '/public_recipes', to: 'recipes#index', as: 'public_recipes'
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  get '/recipes', to: 'users#index', as: 'recipes'
  get '/general_shopping_list', to: 'recipe_foods#index', as: 'shopping'

#  link to delete recipe
  delete '/recipes/:id', to: 'recipes#destroy', as: 'delete_recipe'
end
