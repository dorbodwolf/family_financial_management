class ExpenseSubType < ApplicationRecord
  belongs_to :expense_type
  has_many :expense_leaf_type
end
