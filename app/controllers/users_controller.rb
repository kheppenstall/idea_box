class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account successfully created!"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = @user.errors.full_messages.first
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Account successfully updated!"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = @user.errors.full_messages.first
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end