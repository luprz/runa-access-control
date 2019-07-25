# frozen_string_literal: true

# Employee model
class Employee < User
  has_many :subjects, dependent: :destroy
  has_many :administrators, through: :subjects
  has_many :operations, dependent: :destroy

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
