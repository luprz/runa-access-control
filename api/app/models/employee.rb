# frozen_string_literal: true

# Employee model
class Employee < User
  has_many :subjects, dependent: :destroy
  has_many :administrators, through: :subjects
  has_many :operations

  # Instance function to register check in or check out
  def check_toggle(note:)
    operation_status = status.eql?('in') ? 'out' : 'in'
    Operation.create(
      status: operation_status,
      note: note,
      employee_id: id
    )
  end

  # Instance function to show of employee status
  def status
    last_operation = operations.last
    last_operation ? last_operation.status : 'out'
  end
end
