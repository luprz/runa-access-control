# frozen_string_literal: true

# Control Policy: Permit control class for
#                 check in and out of employees
class ControlPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  # Allow to obtain the list of operations
  # only to administrators
  def index?
    loudly { @user.is_a? Administrator }
  end
end
