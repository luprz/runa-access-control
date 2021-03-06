class OperationsController < ApplicationController
  before_action :authenticate_user
  before_action :authorize
  def check_in
    operation.check_in(params[:employee_id])
    redirect_to root_path
  end

  def check_out
    operation.check_out(params[:employee_id])
    redirect_to root_path
  end

  def history
    @operations = admin.operations(current_user.data.id)
  end

  private

  def operation
    Operation.new(headers: session[:headers])
  end

  def admin
    Administrator.new(headers: session[:headers])
  end
  
end
