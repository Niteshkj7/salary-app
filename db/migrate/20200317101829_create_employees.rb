class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.text :address
      t.date :joining_date

      t.timestamps
    end
  end
end
