class AdministratorsController < ApplicationController
  before_action :authenticate_user
  before_action :authorize
  before_action :set_admin, only: %i[edit update]

  def index
    @administrators = admin.all
  end

  def new; end

  def create
    @admin = admin.create(params[:administrator])
    if @admin['data']
      redirect_to administrators_index_path
    else
      add_errors(@admin)
      render :new
    end
  end

  def edit; end

  def update
    @admin_updated = admin.update(params[:id], params[:administrator])
    if @admin_updated['data']
      redirect_to administrators_index_url
    else
      add_errors(@admin_updated)
      render :edit
    end
  end

  def destroy
    admin.destroy(params[:id])
    redirect_to administrators_index_url
  end

  private

  def admin
    Administrator.new(headers: session[:headers])
  end

  def add_errors(response)
    field = response.first.first
    error = response.first.last.first
    flash[:notice] = "#{field} #{error}"
  end

  def set_admin
    @administrator = admin.find(params[:id])
  end
end
