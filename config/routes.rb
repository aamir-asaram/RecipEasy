Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "recipes#index"

  resources :users, only: [:index, :show] do
    resources :recipes, only: [:index, :show, :new, :create, :destroy] do
      resources :recipe_foods, only: [:index, :new, :create, :destroy]
    end
    resources :foods, only: [:index, :new, :create]
  end

  get "/public_recipes", to: "recipes#index", as: "public_recipes"
  get "/recipes/:id", to: "recipes#show", as: "recipe"
  get "/recipes", to: "users#index", as: "recipes"
  get "/foods", to: "foods#index", as: "foods"
  get "/general_shopping_list", to: "recipe_foods#index", as: "shopping"

end
