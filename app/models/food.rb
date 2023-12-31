class Food < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :recipe_foods, foreign_key: :food_id, dependent: :destroy

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :user_id, presence: true
end
