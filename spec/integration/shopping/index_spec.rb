require 'rails_helper'

RSpec.describe 'shopping_list/index.html.erb', type: :feature do
  let(:user) { User.create(name: 'Jane', email: 'jane@doe.com', password: '123456') }

  describe 'Testing integration specs for shopping list index page' do
    before :each do
      @food = Food.create(name: 'Pizza', measurement_unit: 'kg', price: 10, quantity: 1, user: user)
      @recipe = Recipe.create(name: 'Pizza', preparation_time: 20, cooking_time: 10, description: 'Yummy',
                              public: false, user: user)
      RecipeFood.create(recipe: @recipe, food: @food, quantity: 2)
      login_as(user, scope: :user)
      visit shopping_path
    end

    context 'When visiting shopping list path' do
      it 'can see food name' do
        expect(page).to have_content('Pizza')
      end

      it 'can see shopping list recipe food quantity' do
        expect(page).to have_content('1')
      end

      it 'shows correct total price' do
        expect(page).to have_content('$10.0')
      end

      it 'shows correct shopping list summary' do
        expect(page).to have_content('Total amount of food to buy: 1')
        expect(page).to have_content('Total value of food needed: $10.0')
      end
    end
  end
end
