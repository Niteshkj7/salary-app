class Leave < ApplicationRecord
  belongs_to :employee
  validate :valid_leave?

  validates :leave_type, :leave_date, presence: true

  def valid_leave?
    if self.employee.joining_date > self.leave_date
        errors.add(:base, "Leave date should be equal to greater than the joining date i.e. #{self.employee.joining_date.strftime("%d of %B, %Y")}")
      end
  end
end
