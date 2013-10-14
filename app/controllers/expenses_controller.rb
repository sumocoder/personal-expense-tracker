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

  def analyze
    expenses_grouped = Expense.find_by_sql("SELECT categories.name, SUM(expenses.cost) AS total_cost FROM expenses inner join categories on expenses.category_id=categories.id GROUP BY categories.name")
    categories_total = expenses_grouped.sum(&:total_cost) 
    gon.chart_data = expenses_grouped.collect { |e| [e.name, (e.total_cost/categories_total).to_f ]}
  end

  def destroy
  end

  private

  def expense_params
    params.require(:expense).permit(:category_id, :merchant_id, :description, :purchase_date, :cost)
  end
end
