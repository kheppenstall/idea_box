class IdeasController < ApplicationController

  before_action :set_user, only: [:index, :destroy]
  def index
    @ideas = @user.ideas
  end

  def destroy
    @idea = current_user.ideas.find(params[:id])
    @idea.destroy
    flash[:warning] = "Idea deleted."
    redirect_to user_ideas_path(@user)
  end

  private

  def set_user
    @user = current_user
  end

end