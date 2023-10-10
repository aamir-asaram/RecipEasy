class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    # Find all foods that belong to the current user
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(foods_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def foods_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
