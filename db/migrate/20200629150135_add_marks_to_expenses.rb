class AddMarksToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :marks, :string
  end
end
