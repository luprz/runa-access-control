# frozen_string_literal: true

# Administrators Policy: Permit control class for
#                        administrators
class AdministratorPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  # Allow to obtain the list of adminstrators
  # only to administrators
  def index?
    loudly { @user.is_a? Administrator }
  end

  # Allow create only to administrators
  def create?
    index?
  end

  # Allow show only to administrators
  def show?
    index?
  end

  # Allow update only to administrators
  def update?
    index?
  end

  # Allow destroy only to administrators
  def destroy?
    index?
  end
end
