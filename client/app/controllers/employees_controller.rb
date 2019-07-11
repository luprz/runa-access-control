class EmployeesController < ApplicationController
  before_action :authenticate_user
  before_action :authorize, except: :show
  before_action :set_employee, only: %i[show edit update]

  def show
    @operations = employee.operations(@employee.data.id)
  end

  def new; end

  def create
    @employee = employee.create(params[:employee])
    if @employee['data']
      redirect_to root_path
    else
      add_errors(@employee)
      render :new
    end
  end

  def edit; end

  def update
    @employee_updated = employee.update(params[:id], params[:employee])
    if @employee_updated['data']
      redirect_to employees_show_url(params[:id])
    else
      add_errors(@employee_updated)
      render :edit
    end
  end

  def destroy
    employee.destroy(params[:id])
    redirect_to root_path
  end
  
  private

  def employee
    Employee.new(headers: session[:headers])
  end

  def add_errors(response)
    field = response.first.first
    error = response.first.last.first
    flash[:notice] = "#{field} #{error}"
  end

  def set_employee
    @employee = employee.find(params[:id])
  end
end
