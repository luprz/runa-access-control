# frozen_string_literal: true

# Controller for users
class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_page

  include Renders

  # Action to get all users
  def index
    policy.index?
    users = User.all.page(@current_page)
    success(users)
  end

  private

  # Function to get current page
  def current_page
    @current_page = params[:page]
  end

  # Permissions to users
  def policy
    @policy ||= ControlPolicy.new(user: current_user)
  end
end
