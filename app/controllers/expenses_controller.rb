class ExpensesController < ApplicationController

  before_action :set_sidebar

  def index
  end

  def new
    @expense = Expense.new
    @trip = Trip.find(params[:id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @expense = Expense.new(expense_params)
    if (@expense.start_date && @expense.end_date) && (@expense.start_date > @expense.end_date)
      flash[:error] = "Can't time travel"
      redirect_to user_trip_path(@user, @trip)
    elsif @expense.save
      @trip.expenses << @expense
      flash[:notice] = "Expense successfully created!"
      redirect_to user_trip_path(@user, @trip)
    else
      flash[:error] = @expense.errors.full_messages.join(", ")
       redirect_to user_trip_path(@user, @trip)
    end
  end

  def show
  end

  def edit
    @expense = Expense.find(params[:id])
    @trip = Trip.find(params[:trip_id])
  end

  def update
    @expense = Expense.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    if @expense.update(expense_params)
      flash[:notice] = "Expense succesfully updated!"
      redirect_to user_trip_path(@user, @trip)
    else
      flash[:error] = @expense.errors.full_messages.join(", ")
      redirect_to user_trip_path(@user, @trip)
    end
  end

  def destroy
    @user = current_user
    @trips = @user.trips
    @expense = Expense.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    if @expense.destroy
      flash[:notice] = "Expense succesfully deleted!"
      redirect_to user_trip_path(@user, @trip)
    else
      flash[:error] = @expense.errors.full_messages.join(", ")
      redirect_to user_trip_path(@user, @trip)
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :expense_type, :amount, :start_date,
                                    :end_date, :notes, :trip_id, :user_id)
  end

  def set_sidebar
    @user = current_user
    @trip = Trip.new
    @trips = @user.trips.all.order("created_at")
  end
end
