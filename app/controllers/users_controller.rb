class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_sidebar

  def show
    @user = User.find_by_id(params[:id])
    @hash = Gmaps4rails.build_markers(@trips) do |trip, marker|
      user_trip_path = view_context.link_to trip.name, user_trip_path(@user, trip), :"data-no-turbolink" => true
      marker.lat trip.latitude
      marker.lng trip.longitude
      marker.infowindow "<b>#{user_trip_path}</b>"
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

  def set_sidebar
    @user = current_user
    @trip = Trip.new
    @trips = @user.trips.all.order("created_at")
  end
end
