class GeneratePayslipsController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
    @salary_allotment = @employee.salary_allotment
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "pdf.html.erb",:template => "salaries/show.html.erb"
        sendemail(@employee)
      end
    end
  end

  def sendemail(employee)
    @employee = employee
    pdf = render_to_string :pdf => 'pdf.html.erb', :template => "salaries/show.html.erb"
    EmployeeMailer.send_salary_slip(@employee, pdf).deliver


  end
end


