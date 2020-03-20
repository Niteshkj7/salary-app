class CreateLeaves < ActiveRecord::Migration[5.2]
  def change
    create_table :leaves do |t|
      t.string :leave_type
      t.date :leave_date
      t.integer :leave_balance
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
