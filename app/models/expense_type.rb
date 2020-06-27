class ExpenseType < ApplicationRecord
    has_many :expense_sub_type
end
