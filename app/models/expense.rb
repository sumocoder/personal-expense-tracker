class Expense < ActiveRecord::Base
  belongs_to :category
  belongs_to :merchant

  validates :category_id, presence: true
  validates :merchant_id, presence: true
  validates :purchase_date, presence: true
  validates :cost, numericality: true, presence: true
end
