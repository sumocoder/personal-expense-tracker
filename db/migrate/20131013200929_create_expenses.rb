class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.date :purchase_date
      t.text :description
      t.decimal :cost
      t.timestamps
    end
  end
end
