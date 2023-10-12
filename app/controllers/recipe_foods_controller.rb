class RecipeFoodsController < ApplicationController
  def index
    @ingredients = []
    Food.all.each do |food|
      recipe_foods_quantity = food.recipe_foods.sum(:quantity)
      difference = food.quantity - recipe_foods_quantity
      next unless difference.negative?

      @ingredients << {
        food: food,
        quantity: difference.abs,
        price: food.price,
        total: difference.abs * food.price,
        measurement: food.measurement_unit
      }
    end
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)
    redirect_to recipe_path(@recipe) if @recipe_food.save
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    recipe_id = @recipe_food.recipe_id
    @recipe_food.destroy
    redirect_to recipe_path(recipe_id)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
