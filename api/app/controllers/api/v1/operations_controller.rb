# frozen_string_literal: true

# Controller to handle check in/check out
class Api::V1::OperationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: %i[check]
  before_action :policy

  # Action to get all operations
  def index
    @policy.index?
    operations = Operation.all.page(@current_page)
    success(operations.order('created_at DESC'))
  end

  # Action to register check in / check out
  def check
    @policy.check?
    note = operation_params[:note]
    operation = @employee.check_toggle(
      note: note,
      admin_id: current_user.id
    )
    operation ? success(operation) : unprocessable_entity(operation)
  end

  # Action to show an operation
  def show
    policy.show?
    operation = Operation.find(params[:id])
    success(operation)
  end

  private

  # Permissions to control
  def policy
    @policy ||= OperationPolicy.new(user: current_user)
  end

  # Function to set employee
  def set_employee
    @employee = Employee.find(operation_params[:employee_id])
  rescue StandardError
    no_found(
      "Couldn't find Employee with 'id'=#{operation_params[:employee_id]}"
    )
  end

  # Params object permit
  def operation_params
    params.require(:operation).permit(
      :employee_id,
      :note
    )
  end
end
