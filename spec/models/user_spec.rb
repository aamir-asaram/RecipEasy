require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'John')
    @recipe = @user.recipes.new(name: 'Pizza', description: 'Delicious', public: true, preparation_time: 10,
                                cooking_time: 20)
    @food = @user.foods.new(name: 'Cheese', measurement_unit: 'g', price: 10, quantity: 100)
    @recipe_food = @recipe.recipe_foods.new(quantity: 10, food_id: @food.id)
  end

  it 'should display recipe title' do
    expect(@recipe.name).to eq('Pizza')
  end

  it 'should have a name' do
    expect(@user.name).to eq('John')
  end

  it 'should have many recipes' do
    expect(@user.recipes.length).to eq(1)
  end

  it 'should have many foods' do
    expect(@user.foods.length).to eq(1)
  end

  it 'should destroy associated recipes when destroyed' do
    @user.destroy
    expect(Recipe.where(user_id: @user.id)).to be_empty
  end

  it 'should destroy associated foods when destroyed' do
    @user.destroy
    expect(Food.where(user_id: @user.id)).to be_empty
  end

  it 'should validate presence of name' do
    user = User.new
    expect(user.valid?).to be false
    expect(user.errors[:name]).to include("can't be blank")
  end
end
