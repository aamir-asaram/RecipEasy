require 'rails_helper'

# t.bigint "user_id", null: false
#     t.string "name", null: false
#     t.string "measurement_unit", null: false
#     t.decimal "price", precision: 10, scale: 2, null: false
#     t.integer "quantity", default: 0, null: false

# Food view
# <tr>
#   <td><%= food.name %></td>
#   <td><%= food.measurement_unit %></td>
#   <td>$<%= food.price %></td>
#   <td><%= button_to 'Destroy', food, method: :delete, data: { confirm: 'Are you sure?' } %></td>
# </tr>

RSpec.describe 'foods/index.html.erb', type: :feature do
  let(:user) { User.create(name: 'Jane', email: 'jane@doe.com', password: '123456') }

  describe 'Testing integration specs for foods index page' do
    before :each do
      Food.create(name: 'Pizza', measurement_unit: 'kg', price: 10, quantity: 2, user: user)
      login_as(user, scope: :user)
      visit foods_path
    end

    context 'When visiting foods path' do
      it 'can see food name' do
        expect(page).to have_content('Pizza')
      end

      it 'can see food measurement unit' do
        expect(page).to have_content('kg')
      end

      it 'can see food price' do
        expect(page).to have_content('$10.0')
      end

      it 'clicking on destroy button should delete the food' do
        click_on 'Destroy'
        expect(page).to_not have_content('Pizza')
      end
    end
  end
end
