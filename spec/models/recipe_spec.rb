require 'rails_helper'

RSpec.describe Recipe, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.new(name: 'John')
    @recipe = @user.recipes.new(name: 'Pizza', description: 'Delicious', public: true, preparation_time: 10,
                                cooking_time: 20)
  end

  context 'When creating a recipe' do
    it 'should display recipe title' do
      expect(@recipe.name).to eq('Pizza')
    end

    it 'should have a description' do
      expect(@recipe.description).to eq('Delicious')
    end

    it 'should have a preparation time' do
      expect(@recipe.preparation_time).to eq(10)
    end

    it 'should have a cooking time' do
      expect(@recipe.cooking_time).to eq(20)
    end

    it 'should have a public attribute' do
      expect(@recipe.public).to eq(true)
    end

    it 'should have a user_id' do
      expect(@recipe.user_id).to eq(@user.id)
    end

    it 'should have recipe_foods' do
      expect(@recipe.recipe_foods.length).to eq(0)
    end
  end
end
