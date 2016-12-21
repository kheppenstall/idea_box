class IdeasController < ApplicationController

  def index
    @user = current_user
    @ideas = @user.ideas
  end
end