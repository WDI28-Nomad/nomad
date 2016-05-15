class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find_by_id(params[:id])
    @trip = Trip.new
    @trips = @user.trips.all.order("created_at")
    @hash = Gmaps4rails.build_markers(@trips) do |trip, marker|
      marker.lat trip.latitude
      marker.lng trip.longitude
      marker.infowindow trip.destination
    end
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
