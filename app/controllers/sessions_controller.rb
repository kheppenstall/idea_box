class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "You successfully logged in!"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "Name or password incorrect"
      render :new
    end
  end

  def destroy
    reset_session
    flash[:warning] = "You are now logged out."
    redirect_to login_path
  end

end