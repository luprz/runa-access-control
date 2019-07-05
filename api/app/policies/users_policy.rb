# frozen_string_literal: true

# Users Policy: Permit control class for
#               users
class UsersPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  # Allow to obtain the list of users
  # only to administrators
  def index?
    loudly { @user.administrator? }
  end
end
