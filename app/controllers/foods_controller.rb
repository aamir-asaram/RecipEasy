class FoodsController < ApplicationController
  def index
    @foods = Food.find_by(user_id: 1)
  end
end
