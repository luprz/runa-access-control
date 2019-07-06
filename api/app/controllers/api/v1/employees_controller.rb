# frozen_string_literal: true

# Controller for employees
class Api::V1::EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_page

  include Renders

  # Action to get all employees
  def index
    policy.index?
    employees = Employee.all.page(@current_page)
    employees = employees.reject { |a| a.eql?(current_user) }
    success(employees)
  end

  private

  # Function to get current page
  def current_page
    @current_page = params[:page]
  end

  # Permissions to users
  def policy
    @policy ||= EmployeePolicy.new(user: current_user)
  end
end
