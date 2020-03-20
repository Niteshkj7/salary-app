class EmployeeMailer < ActionMailer::Base
  default :from => "nkj7.me@gmail.com"

  def send_salary_slip(employee, pdf)
    @employee = employee
    attachments['salary_slip.pdf'] = pdf
    mail(:to => @employee.email, :subject => "Salary Slip PDF - #{@employee.name}, Check It")
  end
end