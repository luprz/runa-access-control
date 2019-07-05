class ControlPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def index?
    loudly { @user.administrator? }
  end
end
