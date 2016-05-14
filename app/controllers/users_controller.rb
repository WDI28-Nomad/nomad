class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find_by_id(params[:id])
    @trip = Trip.new
    @trips = Trip.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end


  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city, :avatar, :username)
  end
end
