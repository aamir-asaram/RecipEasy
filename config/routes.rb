# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Define your application routes

  root 'recipes#index'

  resources :foods, except: [:update]

  resources :users, only: %i[index show] do
    resources :recipes, only: %i[index show new create destroy update] do
      resources :recipe_foods, only: %i[index new create destroy]
    end
    resources :foods, only: %i[index new create]
  end

  resources :recipes, only: [:show, :update] # Corrected "recipes" resource

  get '/public_recipes', to: 'recipes#index', as: 'public_recipes'
  get '/recipes/:id', to: 'recipes#show', as: 'view_recipe'
  get '/recipes', to: 'users#index', as: 'recipes'
  get '/general_shopping_list', to: 'recipe_foods#index', as: 'shopping'

  delete '/recipes/:id', to: 'recipes#destroy', as: 'delete_recipe'
end
