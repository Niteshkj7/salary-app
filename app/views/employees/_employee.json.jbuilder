json.extract! employee, :id, :name, :email, :gender, :address, :joining_date, :created_at, :updated_at
json.url employee_url(employee, format: :json)
