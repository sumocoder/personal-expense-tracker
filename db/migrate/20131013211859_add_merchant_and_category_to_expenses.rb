class AddMerchantAndCategoryToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :category_id, :integer
    add_column :expenses, :merchant_id, :integer    
  end
end
