class CreateIncomeTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :income_types do |t|
      t.string :income_type

    end
  end
end
