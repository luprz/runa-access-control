class HomeController < ApplicationController
  before_action :authenticate_user
  before_action :authorize

  def index
    admin_id = current_user.data.id
    @employees = admins.employees(admin_id)
  end

  private

  def admins
    Administrator.new(headers: session[:headers])
  end
end
