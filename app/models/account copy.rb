class Account < ApplicationRecord
  belongs_to :user

  scope :recent, -> { order("id desc") }

  def total_income
    general_income + other_income
  end

  def total_expenses
    general_expenses + other_expenses
  end

  def balance
    total_income - total_expenses
  end
end
