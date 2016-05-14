class TripsController < ApplicationController

  def show
    @trip = Trip.find(params[:id])
    @user = User.find_by_id(@trip.user_id)
  end

  def new
    @trip = Trip.new
  end

  def create
    @user = current_user
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    if @trip.save
      flash[:notice] = "New Trip Created!"
      redirect_to user_path(@user)
    else
      flash[:error] = @trip.errors.full_messages
      render :new
    end
  end
end


private

def trip_params
  params.require(:trip).permit(:name, :type, :budget, :origin, :destination, :description, :departure_date, :return_date, :user_id)
end
