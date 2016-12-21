class IdeasController < ApplicationController

  before_action :set_user, only: [:index, :destroy, :new]

  def index
    @ideas = @user.ideas
  end

  def destroy
    @idea = @user.ideas.find(params[:id])
    @idea.destroy
    flash[:warning] = "Idea deleted."
    redirect_to user_ideas_path(@user)
  end

  def new
    @idea = @user.ideas.new
    @categories = Category.all
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end