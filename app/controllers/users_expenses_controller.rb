class UsersExpensesController < ApplicationController
  def accept
  	@users_expense = UsersExpense.find(params[:users_expense_id])

  	if @users_expense && @users_expense.user_id == session[:user_id]
  		@users_expense.status = "unpaid"

  		if @users_expense.save
  			@posted = true
  			users_expenses = @users_expense.expense.users_expenses

  			users_expenses.each do |users_expense|
  				if users_expense.status == "rejected" || users_expense.status == "pending"
  					@posted = false
  				end
  			end

  			if @posted
  				expense = @users_expense.expense
  				expense.status = "posted"
  				expense.save
  			end

  			flash[:notice] = "You have successfully accepted the expense."
  		else
  			flash[:alert] = "There was an error while accepting the expense."
  		end
  	else
  		flash[:alert] = "The expense does not exist or you cannot accept an expense that does not belong to you."
  		redirect_to :back
  	end
  end

  def pay
  	@users_expense = UsersExpense.find(params[:users_expense_id])

  	if @users_expense && @users_expense.user_id == session[:user_id]
  		@users_expense.status = "paid"

  		if @users_expense.save
  			flash[:notice] = "You have successfully marked the expense as paid."
  		else
  			flash[:alert] = "There was an error while marking the expense as paid."
  		end
  	else
  		flash[:alert] = "The expense does not exist or you cannot mark expense as paid that does not belong to you."
  		redirect_to :back
  	end
  end

  def confirm
  end
end
