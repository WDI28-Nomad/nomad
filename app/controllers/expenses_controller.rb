class ExpensesController < ApplicationController
  def index
  end

  def new
    @user = current_user
    @trips = @user.trips
    @expense = Expense.new
  end

  def create
    @user = current_user
    @trips = @user.trips
    @expense = Expense.new(expense_params)
    @trip = Trip.find(params[:id])
    if @expense.save
      flash[:notice] = "Expense successfully created!"
      redirect_to user_trip(@user, @trip)
    else
      flash[:error] = expense.errors.full_messages.join(", ")
      # Might change after implementing Abracadabra
      redirect_to user_trip(@user, @trip)
    end
  end

  def show
  end

  def edit
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :expense_type, :amount, :start_date,
                                    :end_date, :notes)
  end
end
