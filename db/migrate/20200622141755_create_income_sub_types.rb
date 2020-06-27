class CreateIncomeSubTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :income_sub_types do |t|
      t.string :subtype
      t.references :income_type, foreign_key: true
    end
  end
end
