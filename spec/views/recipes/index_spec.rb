# spec/features/recipes_index_spec.rb
require 'rails_helper'

RSpec.describe 'recipes/index.html.erb', type: :feature do
  let(:user) { User.create(name: 'John', email: 'test@test.com', password: '121212') }
  let(:user2) { User.create(name: 'John2', email: 'john@gmail.com', password: '121212') }

  describe 'Testing integration specs for recipes index page' do
    before :each do
      Recipe.create(name: 'Pizza', preparation_time: 20, cooking_time: 10, description: 'Yummy', public: false,
                    user: user)
      Recipe.create(name: 'Pasta', preparation_time: 20, cooking_time: 10, description: 'Yummier', public: true,
                    user: user2)
      login_as(user2, scope: :user)
      visit public_recipes_path
    end

    context 'When visiting public recipes' do
      it 'cannot see other users private recipes' do
        expect(page).to_not have_content('Pizza')
      end

      it 'can see recipe name' do
        expect(page).to have_content('Pasta')
      end

      it 'can see recipe owner' do
        expect(page).to have_content('by John2')
      end

      it 'can see total food items' do
        expect(page).to have_content('Total food items: 0')
      end

      it 'can see total food cost' do
        expect(page).to have_content('Total price: $0')
      end

      it 'clicking on view button should redirect to recipe show page' do
        click_on 'View'
        expect(page).to have_content('Pasta')
      end
    end
  end
end
