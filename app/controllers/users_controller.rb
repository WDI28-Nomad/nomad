class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sidebar

  def show
    @user = User.find_by_id(params[:id])
    if @user != current_user
      redirect_to root_path
      flash[:error] = "You do not have access to this account"
    end
    @hash = Gmaps4rails.build_markers(@trips) do |trip, marker|
      marker.lat trip.latitude
      marker.lng trip.longitude
      marker.infowindow trip.name
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
    if @user != current_user
      redirect_to root_path
      flash[:error] = "You do not have access to this account"
    end
  end

  def update
    if access?(@user.id) && @user.update(user_params)
        flash[:notice] = "Account successfully updated"
        redirect_to user_path
      else
        redirect_to welcome_index_path
        flash[:error] = "You do not have access to this account"
    end
  end

  private

  def access?(user_id)
    current_user ? user_id == current_user.id : false
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city, :avatar, :username)
  end

  def set_sidebar
    @user = current_user
    @trip = Trip.new
    @trips = @user.trips.all.order("created_at")
  end
end
