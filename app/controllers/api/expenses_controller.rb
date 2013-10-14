class Api::ExpensesController < ApplicationController

  def index
    @expenses = Expense.include([:merchant, :category]).all
    render json: @expenses
  end

  def create
    @expense = Expense.new(params[:expense])
    if @expense.save
      render json: @expense
    else
      render json: { errors: @expense.errors.full_messages }
    end
  end

  def destroy
  end
end
