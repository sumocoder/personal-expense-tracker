class ExpensesController < ApplicationController

  def index
    @expenses = Expense.includes([:merchant, :category]).order("purchase_date DESC").load
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      flash[:notice] = "Expense added"
    else
      flash[:error] = @expense.errors.full_messages
    end
    redirect_to expenses_url
  end

  def destroy
  end

  private

  def expense_params
    params.require(:expense).permit(:category_id, :merchant_id, :description, :purchase_date, :cost)
  end
end
