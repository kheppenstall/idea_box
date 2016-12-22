class IdeasController < ApplicationController

  before_action :set_user
  before_action :set_idea, only: [:destroy, :edit, :update, :show]
  before_action :set_categories, only: [:new, :edit]

  def index
    set_ideas
  end

  def destroy
    @idea = @user.ideas.find(params[:id])
    @idea.destroy
    flash[:warning] = "Idea deleted."
    redirect_to user_ideas_path(@user)
  end

  def new
    @idea = @user.ideas.new
  end

  def create
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:success] = "Idea added!"
      redirect_to user_ideas_path(@user)
    else
      set_categories
      flash[:danger] = @idea.errors.full_messages.first
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @idea.update(idea_params)
      set_ideas
      flash[:success] = "Idea updated!"
      redirect_to user_ideas_path(@user)
    else
      set_categories
      flash.now[:danger] = @idea.errors.full_messages.first
      render :edit
    end
  end

  private

  def set_ideas
    @ideas = @user.ideas
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_idea
    @idea = @user.ideas.find(params[:id])
  end

  def set_categories
    @categories = Category.order(:name)
  end

  def idea_params
    params.require(:idea).permit(:content, :category_id)
  end
end