class UsersController < ApplicationController
  def index
    user = current_user
    @recipes = user.recipes
  end
end
