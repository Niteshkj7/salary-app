module EmployeesHelper
  def total_salary(employee)

    earning_amount = []
    deduction_amount = []
    days_in_current_month =  Time.days_in_month(Time.now.month)
    total_salary = 0

    salary_allotment = employee.salary_allotment.as_json
    return total_salary = 0 if salary_allotment.nil?
    all_keys = salary_allotment.keys 
    leaves = Leave.where(:leave_type => "loss of pay", :employee_id => employee.id).count
    working_days = days_in_current_month - leaves
    salary_allotment.delete("id")
    salary_allotment.delete("created_at")
    salary_allotment.delete("updated_at")
    salary_allotment.delete("employee_id")
    salary_allotment.each do |key,value|
      salary_allotment[key] = ((value * working_days) / days_in_current_month).round(2)
    end
    required_keys = all_keys.delete_if {|i| i == "id" || i == "employee_id" || i == "created_at" || i == "updated_at"}
    earning_salary_heads = employee.salary_heads.where(:earning => true).pluck(:head_name)
    deduction_salary_heads = employee.salary_heads.where(:deduction => true).pluck(:head_name)
    earning_salary_heads.each do |i|
      earning_amount << salary_allotment[i].to_i
    end
    earning_salary_amount = earning_amount.sum
    deduction_salary_heads.each do |i|
      i.tr!(" ","_")
    end

    deduction_salary_heads.each do |i|
      deduction_amount << salary_allotment[i].to_i
    end
    dedcution_salary_amount = deduction_amount.sum




    return total_salary = ((earning_salary_amount - dedcution_salary_amount) * working_days / days_in_current_month)
  end
end
