class TripsController < ApplicationController

  #TODO: Helper Method for setting trips
  before_action :set_sidebar

  def show
    @trip = Trip.find(params[:id])
    @user = current_user
    @expense = Expense.new
    @expenses = @trip.expenses  
  end

  def new
    @user = current_user
    @trip = Trip.create(name: "untitled")

    redirect_to user_trip_path(current_user, @trip)
  end

  def create
    @user = current_user
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    if @trip.save
      flash[:notice] = "New Trip Created!"
      redirect_to user_trip_path(@user, @trip)
    else
      flash[:error] = @trip.errors.full_messages
      render :new
    end
  end

  def edit
    @user = current_user

    @trip = @user.trips.find(params[:id])

    if @user != current_user
      redirect_to root_path
    end
  end

  def update
    @user = current_user
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    redirect_to user_trip_path(@user, @trip)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @user = User.find_by_id(@trip.user_id)
    if @trip.destroy
      flash[:error] = "Deleted trip!"
      redirect_to user_path(current_user)
    else
      flash[:error] = @trip.errors.full_messages
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :trip_type, :budget, :origin, :destination, :description, :departure_date, :return_date, :user_id)
  end

  def set_sidebar
    @trip = Trip.new
    @trips = current_user.trips.all.order("created_at")
  end
end