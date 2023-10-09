# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :preparation_time, null: false, default: 0
      t.integer :cooking_time, null: false, default: 0
      t.text :description, null: false
      t.boolean :public, null: false, default: true

      t.timestamps
    end
  end
end
