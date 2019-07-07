# frozen_string_literal: true

# Operation Policy: Permit control class for
#                   check in and out of employees
class OperationPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  # Allow to obtain the list of operations
  # only to administrators
  def index?
    loudly { @user.is_a? Administrator }
  end

  # Allow to register check in / check out
  def check?
    index?
  end

  # Allow to show operations
  def show?
    index?
  end
end
