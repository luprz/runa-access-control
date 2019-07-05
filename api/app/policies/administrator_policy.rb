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

  # Allow create only to adinistratios
  def create?
    loudly { @user.is_a? Administrator }
  end

  # Allow show only to adinistratios
  def show?
    loudly { @user.is_a? Administrator }
  end
end
