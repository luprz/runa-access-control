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

  # Action to create a administrator
  def create
    admin = Administrator.new(admin_params)

    if admin.save
      success(admin)
    else
      bad_request(admin.errors)
    end
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

  def admin_params
    params.require(:administrator).permit(
      :name, :email, :password
    )
  end
end
