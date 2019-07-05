# frozen_string_literal: true

# Controller for users
class Api::V1::AdministratorsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_page
  before_action :set_administrator, only: %i[show]

  include Renders

  # Action to get all adminstrators
  def index
    policy.index?
    admins = Administrator.all.page(@current_page)
    success(admins)
  end

  # Action to create a administrator
  def create
    policy.create?
    admin = Administrator.new(admin_params)

    if admin.save
      created(admin)
    else
      unprocessable_entity(admin.errors)
    end
  end

  # Action to show an administrator
  def show
    policy.show?
    success(@administrator)
  end

  private

  # Set an administrator
  def set_administrator
    @administrator = Administrator.find(params[:id])
  rescue StandardError
    no_found("Couldn't find Administrator with 'id'=#{params[:id]}")
  end

  # Function to get current page
  def current_page
    @current_page = params[:page]
  end

  # Permissions to users
  def policy
    @policy ||= AdministratorPolicy.new(user: current_user)
  end

  # Params object
  def admin_params
    params.require(:administrator).permit(
      :name, :email, :password
    )
  end
end
