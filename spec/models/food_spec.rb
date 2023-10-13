require 'rails_helper'

# create_table "recipes", force: :cascade do |t|
#     t.bigint "user_id", null: false
#     t.string "name", null: false
#     t.integer "preparation_time", default: 0, null: false
#     t.integer "cooking_time", default: 0, null: false
#     t.text "description", null: false
#     t.boolean "public", default: true, null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["user_id"], name: "index_recipes_on_user_id"
#   end

RSpec.describe Food, type: :model do
  subject do
    @user = User.new(name: 'jane', email: 'jane@doe.com')
    @food = Food.new(name: 'Pancake', measurement_unit: 'pieces', price: 30, user_id: @user.id)
  end

  it 'is not valid without a name' do
    subject.name = ' '
    expect(subject).to_not be_valid
  end

  it 'is not valid without a measurement unit' do
    subject.measurement_unit = ' '
    expect(subject).to_not be_valid
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'has the correct name' do
    expect(subject.name).to eq('Pancake')
  end
end
