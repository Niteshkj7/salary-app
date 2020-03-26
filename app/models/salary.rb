class Salary < ApplicationRecord
  belongs_to :employee
  extend EmployeesHelper
  
end
