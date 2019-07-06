# frozen_string_literal: true

# Employees Policy: Permit control class for
#                   employees
class EmployeePolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  # Allow to obtain the list of employees
  # only to administrators
  def index?
    loudly { @user.is_a? Administrator }
  end

  # Allow create only to administrators
  def create?
    loudly { @user.is_a? Administrator }
  end

  # Allow show only to administrators
  def show?
    loudly { @user.is_a? Administrator }
  end

  # Allow update only to administrators
  def update?
    loudly { @user.is_a? Administrator }
  end
end
