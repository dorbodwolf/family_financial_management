class CreateExpenseLeafTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :expense_leaf_types do |t|
      t.string :leaftype
      t.references :expense_sub_type, foreign_key: true

    end
  end
end
