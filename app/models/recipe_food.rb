# frozen_string_literal: true

class RecipeFood < ApplicationRecord
  belongs_to :recipe, foreign_key: :recipe_id
  belongs_to :food, foreign_key: :food_id

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
