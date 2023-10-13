class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: :recipe_id, dependent: :destroy

  validates :name, presence: true
  validates :preparation_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true
  validates :public, inclusion: { in: [true, false] }
  validates :user_id, presence: true

  def food_cost
    recipe_foods.map { |recipe_food| recipe_food.food.price * recipe_food.quantity }.sum
  end
end
