class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :expense_type
      t.decimal :value
      t.string :subtype
      t.string :detailtype
      t.datetime :credit_day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
