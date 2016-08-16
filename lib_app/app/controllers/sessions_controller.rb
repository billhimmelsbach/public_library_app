class SessionsController < ApplicationController

  # before_action :logged_in?, only: [:new, :create, :destroy]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "Successfully logged in."
      redirect_to @user
    else
      flash[:notice] = "Incorrect email or password."
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
