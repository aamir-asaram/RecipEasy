require 'rails_helper'

RSpec.describe 'userss/index.html.erb', type: :feature do
  let(:user) { User.create(name: 'John', email: 'test@test.com', password: '121212') }

  describe 'Testing integration specs for users index page' do
    before :each do
      Recipe.create(name: 'Pizza', preparation_time: 20, cooking_time: 10, description: 'Yummy', public: false,
                    user: user)
      login_as(user, scope: :user)
      visit recipes_path
    end

    context 'When visiting user recipes' do
      it 'can see the name of the recipe' do
        expect(page).to have_content('Pizza')
      end

      it 'can see the recipe description' do
        expect(page).to have_content('Yummy')
      end

      it 'should display a remove button' do
        expect(page).to have_content('Remove')
      end

      it 'clicking on view button should redirect to recipe show page' do
        click_on 'View'
        expect(page).to have_content('Pizza')
      end

      it 'clicking on remove button should remove the recipe' do
        click_on 'Remove'
        expect(page).to_not have_content('Pizza')
      end
    end
  end
end
