class CreateSalaryAllotments < ActiveRecord::Migration[5.2]
  def change
    create_table :salary_allotments do |t|
      t.decimal :basic
      t.decimal :hra
      t.decimal :da
      t.decimal :income_tax
      t.decimal :state_tax
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
