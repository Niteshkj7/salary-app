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
    earning_salary_heads = SalaryHead.where(:earning => true).pluck(:head_name).uniq
    deduction_salary_heads = SalaryHead.where(:deduction => true).pluck(:head_name).uniq
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




    return total_salary = (earning_salary_amount - dedcution_salary_amount) 
  end

  def total_deductions(employee)
    deduction_amount = []
    salary_allotment = employee.salary_allotment.as_json
    leaves =  Leave.where(:leave_type => "loss of pay", :employee_id => employee.id).count
    days_in_current_month =  Time.days_in_month(Time.now.month)
    working_days = days_in_current_month - leaves
    deduction_salary_heads = SalaryHead.where(:deduction => true).pluck(:head_name).uniq
    all_keys = salary_allotment.keys 
    salary_allotment.delete("id")
    salary_allotment.delete("created_at")
    salary_allotment.delete("updated_at")
    salary_allotment.delete("employee_id")
    salary_allotment.each do |key,value|
      salary_allotment[key] = ((value * working_days) / days_in_current_month).round(2)
    end
    required_keys = all_keys.delete_if {|i| i == "id" || i == "employee_id" || i == "created_at" || i == "updated_at"}
    deduction_salary_heads.each do |i|
      i.tr!(" ","_")
    end
    deduction_salary_heads.each do |i|
      deduction_amount << salary_allotment[i].to_i
    end
    return dedcution_salary_amount = deduction_amount.sum
  end


end
