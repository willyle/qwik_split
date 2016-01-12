class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
  end

  def create
    total_amount = 0
    @save = true

    params[:amount].each do |amount|
      total_amount += (amount.to_f)*1000
    end

    if total_amount == ((params[:expense][:total]).to_f)*1000 && (params[:expense][:total]).to_f > 0
      @expense = Expense.new(expense_params)
      @expense.trip_id = params[:trip_id]
      @expense.total = ((params[:expense][:total]).to_f)*1000
      @expense.creator_id = session[:user_id]
      @expense.status = "pending"

      if @expense.save
        for i in 0...params[:emails].length
          if (params[:amount][i]).to_f != 0
            user = Profile.find_by(email: params[:emails][i]).user
            members = Trip.find(@expense.trip_id).accepted_users

            if user && members.include?(user)
              users_expense = UsersExpense.new(user_id: user.id, expense_id: @expense.id)
              users_expense.amount = ((params[:amount][i]).to_f)*1000

              if user.id == session[:user_id]
                users_expense.status = "confirmed"
              else
                users_expense.status = "pending"
              end

              if !users_expense.save
                @save = false
              end
            end
          end
        end

        if !@save
          @expense.destroy
          flash[:alert] = "There was an error with adding individual expenses"
        end

      else
        @save = false
        flash[:alert] = "The expense could not be added. Please try again."
      end

    else
      @save = false
      flash[:alert] = "The total cannot be 0 or does not match the sum of the amounts."
    end

    if @save == false
      @expense = Expense.new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def expense_params
      params.require(:expense).permit(:title, :description)
    end
end
