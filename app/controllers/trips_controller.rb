class TripsController < ApplicationController

  #TODO: Helper Method for setting trips

  def show
    @trip = Trip.find(params[:id])
    @user = User.find_by_id(@trip.user_id)
    @trips = @user.trips
    @trips = Kaminari.paginate_array(@trips).page(params[:page]).per(7)
    @expense = Expense.new
    @expenses = @trip.expenses  
  end

  def new
    @user = current_user
    @trip = Trip.new
    @trips = @user.trips
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
    @trips = @user.trips
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
end


private

def trip_params
  params.require(:trip).permit(:name, :trip_type, :budget, :origin, :destination, :description, :departure_date, :return_date, :user_id)
end
