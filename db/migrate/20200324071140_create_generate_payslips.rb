class CreateGeneratePayslips < ActiveRecord::Migration[5.2]
  def change
    create_table :generate_payslips do |t|

      t.timestamps
    end
  end
end
