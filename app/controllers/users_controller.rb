class UsersController < ApplicationController
  def index
    user = User.find(1) # TODO: Change this to current_user
    @recipes = user.recipes
  end
end
