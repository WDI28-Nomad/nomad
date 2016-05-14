class ExpensesController < ApplicationController
  def index
  end

  def new
    @user = current_user
    @trips = @user.trips
    @expense = Expense.new
    @trip = Trip.find(params[:id])
  end

  def create
    @user = current_user
    @trips = @user.trips
    @expense = Expense.new(expense_params)
    @trip = Trip.find(params[:trip_id])
    if @expense.save
      @trip.expenses << @expense
      flash[:notice] = "Expense successfully created!"
      redirect_to user_trip_path(@user, @trip)
    else
      flash[:error] = expense.errors.full_messages.join(", ")
      # Might change after implementing Abracadabra
      redirect_to user_path(@user)
    end
  end

  def show
  end

  def edit
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :expense_type, :amount, :start_date,
                                    :end_date, :notes, :trip_id, :user_id)
  end
end
