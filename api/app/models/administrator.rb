# frozen_string_literal: true

# Administrator model
class Administrator < User
  has_many :subjects, dependent: :destroy
  has_many :employees, through: :subjects
  has_many :operations, dependent: :destroy

  # Instance function to assign an employee
  # to an administrators
  def register(employee)
    subject = Subject.new(
      administrator_id: id,
      employee_id: employee.id
    )
    subject.save ? true : false
  end
end
