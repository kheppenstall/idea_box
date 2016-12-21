class SessionsController < ApplicationController

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

end