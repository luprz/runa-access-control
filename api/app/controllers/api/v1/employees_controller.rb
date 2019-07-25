# frozen_string_literal: true

# Controller for employees
class Api::V1::EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: %i[show update destroy]
  before_action :current_page, only: %i[index]
  before_action :policy

  include Renders

  # Action to get all employees
  def index
    @policy.index?
    employees = Employee.all.page(@current_page)
    success(employees)
  end

  # Action to create a employee
  def create
    @policy.create?
    employee = Employee.new(employee_params)

    if employee.save
      current_user.add_employee(employee)
      created(employee)
    else
      unprocessable_entity(employee.errors)
    end
  end

  # Action to show an employee
  def show
    @policy.show?
    success(@employee)
  end

  # Action to update an employee
  def update
    @policy.update?
    if @employee.update(employee_params)
      success(@employee)
    else
      unprocessable_entity(@employee.errors)
    end
  end

  # Action to destroy an employee
  def destroy
    @policy.destroy?
    @employee.destroy
    head :no_content
  end

  # Action to get operations
  def operations
    @policy.show?
    employee = Employee.find(params[:employee_id])
    operations = employee.operations
    success(operations.order('created_at DESC'))
  end

  private

  # Set an employee
  def set_employee
    @employee = Employee.find(params[:id])
  rescue StandardError
    no_found("Couldn't find Employee with 'id'=#{params[:id]}")
  end

  # Permissions to users
  def policy
    @policy ||= EmployeePolicy.new(user: current_user)
  end

  # Params object permit
  def employee_params
    params.require(:employee).permit(
      :name, :email, :password, :position
    )
  end
end
