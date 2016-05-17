class Expense < ActiveRecord::Base
  belongs_to :trip

  validates :name, :expense_type, :amount,
    presence: true
end
