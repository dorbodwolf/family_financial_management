class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.string :income_type
      t.decimal :value
      t.string :subtype
      t.string :detail
      t.datetime :credit_day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
