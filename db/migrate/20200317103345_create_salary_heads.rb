class CreateSalaryHeads < ActiveRecord::Migration[5.2]
  def change
    create_table :salary_heads do |t|
      t.string :head_name
      t.boolean :earning
      t.boolean :deduction
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
