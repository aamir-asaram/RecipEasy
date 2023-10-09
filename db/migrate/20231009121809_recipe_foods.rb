class RecipeFoods < ActiveRecord::Migration[7.0]
  def change
    t.references :recipe, null: false, foreign_key: true
    t.references :food, null: false, foreign_key: true
    t.integer :quantity, null: false, default: 0
  end
end
