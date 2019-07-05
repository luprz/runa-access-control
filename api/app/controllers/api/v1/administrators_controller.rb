# frozen_string_literal: true

# Controller for users
class Api::V1::AdministratorsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_page

  include Renders

  # Action to get all adminstrators
  def index
    policy.index?
    admins = Administrator.all.page(@current_page)
    success(admins)
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
