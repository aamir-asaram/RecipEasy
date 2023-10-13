require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.new(name: 'jane', email: 'jane@doe.com')
    @recipe = Recipe.new(name: 'Chicken breasts', preparation_time: 30, cooking_time: 20,
                                description: 'Some description', public: false, user_id: @user.id)
    @food = Food.new(name: 'chicken', measurement_unit: 'pieces', price: 30, user_id: @user.id)
    @recipe_food = RecipeFood.new(quantity: 3, food_id: @food.id, recipe_id: @recipe.id)
    @recipe_food.food = @food
    @recipe_food.recipe = @recipe
  end

  it 'should be valid with valid attributes' do
    expect(@recipe_food).to be_valid
  end

  it 'should not be valid without a quantity' do
    @recipe_food.quantity = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'should not be valid without a food' do
    @recipe_food.food = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'should not be valid without a recipe' do
    @recipe_food.recipe = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'should have the correct quantity' do
    expect(@recipe_food.quantity).to eq(3)
  end

  it 'should have the correct food' do
    expect(@recipe_food.food).to eq(@food)
  end

  it 'should have the correct recipe' do
    expect(@recipe_food.recipe).to eq(@recipe)
  end
end
