class UsersController < ApplicationController
  
  before_action :authenticate_user!

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city, :image)
  end
end
