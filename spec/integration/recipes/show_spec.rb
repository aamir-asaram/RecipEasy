RSpec.describe 'recipe/show.html.erb', type: :feature do
  let(:user) { User.create(name: 'John', email: 'test@test.com', password: '121212') }

  describe 'Testing integration specs for recipe page' do
    before :each do
      Recipe.create(name: 'Pizza', preparation_time: 20, cooking_time: 10, description: 'Yummy', public: false,
                    user: user)
      login_as(user, scope: :user)
      visit recipe_path(Recipe.last)
    end

    context 'When visiting recipe details' do
      it 'can see the name of the recipe' do
        expect(page).to have_content('Pizza')
      end

      it 'can see the recipe description' do
        expect(page).to have_content('Yummy')
      end

      it 'should display the preparation time' do
        expect(page).to have_content('Preparation time: 20')
      end

      it 'should display the cooking time' do
        expect(page).to have_content('Cooking time: 10')
      end

      it 'should display a toggle' do
        expect(page).to have_content('Public')
      end

      it 'clicking on the toggle should change the recipe to private' do
        check 'Public'
        expect(Recipe.last.public).to eq(false)
      end
    end

    context 'Recipe ingredients:' do
      it 'clicking on add ingredient should redirect to form page' do
        click_on 'Add ingredient'
        expect(page).to have_content('Please add some foods before creating a recipe')
      end

      it 'should display list of ingredients' do
        expect(page).to have_content('Ingredients')
      end

      it 'should display ingredient name' do
        Food.create(name: 'Tomato', price: 2, quantity: 5, measurement_unit: 'tomatoes', user: user)
        RecipeFood.create(food_id: Food.last.id, recipe_id: Recipe.last.id)
        visit recipe_path(Recipe.last)
        expect(page).to have_content('Tomato')
      end

      it 'clicking on remove ingredient should remove the ingredient' do
        Food.create(name: 'Tomato', price: 2, quantity: 5, measurement_unit: 'tomatoes', user: user)
        RecipeFood.create(food_id: Food.last.id, recipe_id: Recipe.last.id)
        visit recipe_path(Recipe.last)
        click_on 'Delete Ingredient'
        expect(page).to_not have_content('Tomato')
      end
    end
  end
end
