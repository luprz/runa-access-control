# frozen_string_literal: true

# Controller to handle check in/check out
class Api::V1::ControlController < ApplicationController
  before_action :authenticate_user!

  # Action for get all operations
  def index
    policy.index?
    message('Ready')
  end

  private

  # Permissions to control
  def policy
    @policy ||= ControlPolicy.new(user: current_user)
  end
end
