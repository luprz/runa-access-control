# frozen_string_literal: true

# Employee model
class Employee < User
  has_many :subjects, dependent: :destroy
  has_many :administrators, through: :subjects
  has_many :operations, dependent: :destroy

  # Instance function to register check in or check out
  def check_toggle(admin_id:, note:)
    operation_status = status.eql?('in') ? 'out' : 'in'
    Operation.create(
      status: operation_status,
      note: note,
      employee_id: id,
      administrator_id: admin_id
    )
  end

  # Instance function to show of employee status
  def status
    last_operation = operations.last
    last_operation ? last_operation.status : 'out'
  end

  # Instance function to show the last employee check date
  def check_date
    last_operation = operations.last
    last_operation ? last_operation.created_at : nil
  end
end
