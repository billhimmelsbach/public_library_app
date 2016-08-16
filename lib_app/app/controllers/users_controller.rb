class UsersController < ApplicationController

  before_action :logged_in?, only: [:show]

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end

  def show
    @user = User.find_by_id(params[:id])
    # if @user.id == session[:user_id]
    if @user.id == current_user.id
      render :show
    else
      redirect_to user_path(current_user)
      # redirect_to ("/users/" + session[:user_id].to_s)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
