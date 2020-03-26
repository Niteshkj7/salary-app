class SalaryHead < ApplicationRecord
  belongs_to :employee
  after_create :create_related_salary_allotment
  validate :atleast_one_is_checked, :all_not_selected

  def create_related_salary_allotment
    head_name = self.head_name
    employee = self.employee
    salary_allotment = employee.salary_allotment
  end

  def all_not_selected
    errors.add(:base, "Please select only one head type") if earning && deduction
  end



  def atleast_one_is_checked
    errors.add(:base, "Please select atleast one head type") unless earning || deduction 
  end

end
