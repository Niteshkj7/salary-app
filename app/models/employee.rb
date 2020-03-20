class Employee < ApplicationRecord
  has_many :salary_heads
  has_one :salary_allotment
  has_many :leaves
  
  def leaves
    Leave.where(:employee_id => self.id)
  end
end
