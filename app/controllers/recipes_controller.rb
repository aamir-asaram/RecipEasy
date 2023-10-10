class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.recipe_foods.destroy_all
    @recipe.destroy
    redirect_to recipes_path
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    redirect_to recipes_path if @recipe.save
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
