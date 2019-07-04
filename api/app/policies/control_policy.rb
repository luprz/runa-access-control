class ControlPolicy < Struct.new(:user, :control)
  attr_reader :user

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.administrator?
  end
end
