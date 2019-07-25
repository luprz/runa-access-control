# frozen_string_literal: true

# Administrator model
class Administrator < User
  has_many :subjects, dependent: :destroy
  has_many :employees, through: :subjects
  has_many :operations, dependent: :destroy
  delegate :register_in, :register_out, to: :checking

  # Instance function to assign an employee
  # to an administrators
  def add_employee(employee)
    subject = Subject.new(
      administrator_id: id,
      employee_id: employee.id
    )
    subject.save ? true : false
  end

  private

  def checking
    Operations::Checking.new(admin: self)
  end
end
