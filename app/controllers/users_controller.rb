class UsersController < ApplicationController
  def index
    @recipes = Recipe.find_by(user_id: 1)
  end
end