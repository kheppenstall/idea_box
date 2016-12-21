class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]
  before_action :verify_user, except: [:new, :create]

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

  def set_user
    @user = User.find(params[:id])
  end

  def verify_user
    unless current_user == set_user
      reset_session
      flash[:danger] = "Login required to access page"
      redirect_to login_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
  
end