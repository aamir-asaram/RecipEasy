class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
