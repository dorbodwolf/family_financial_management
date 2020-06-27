class CreateExpenseSubTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :expense_sub_types do |t|
      t.string :subtype
      t.references :expense_type, foreign_key: true

    end
  end
end
