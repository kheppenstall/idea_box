class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :verify_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account successfully created!"
      redirect_to login_path
    else
      flash.now[:danger] = @user.errors.full_messages.first
      render :new
    end
  end

  def show
    redirect_to user_ideas_path(@user)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Account successfully updated!"
      redirect_to user_ideas_path(@user)
    else
      flash.now[:danger] = @user.errors.full_messages.first
      render :edit
    end
  end

  def destroy
    reset_session
    @user.destroy
    flash[:danger] = "Account deleted."
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
  
end