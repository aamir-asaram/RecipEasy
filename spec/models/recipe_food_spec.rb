require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    user = User.new(name: 'John')
    @recipe = user.recipes.new(name: 'Pizza', description: 'Delicious', public: true, preparation_time: 10, cooking_time: 20)
    @food = user.foods.new(name: 'Cheese', measurement_unit: 'g', price: 10, quantity: 100)
    @recipe_food = @recipe.recipe_foods.new(quantity: 10, food_id: @food.id)
  end

  context 'When creating a recipe_food' do
    it 'should have a quantity' do
      expect(@recipe_food.quantity).to eq(10)
    end

    it 'should have a recipe_id' do
      expect(@recipe_food.recipe_id).to eq(@recipe.id)
    end

    it 'should have a food_id' do
      expect(@recipe_food.food_id).to eq(@food.id)
    end
  end
end
