Rails.application.routes.draw do
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Sessions
  namespace :sessions, path: :users do
    get '/sign_in', action: :new
    post '/create', action: :create
    delete '/sign_out', action: :destroy
  end

   # Administrators
   namespace :administrators do
    get '/', action: :index, as: :index
    get '/new', action: :new, as: :new
    post '/create', action: :create, as: :create
    get '/:id/edit', action: :edit, as: :edit
    patch '/:id/update', action: :update, as: :update
    delete '/:id/destroy', action: :destroy, as: :destroy
  end

  # Employees
  namespace :employees, path: :members do
    get '/:id/profile', action: :show, as: :show
    get '/new', action: :new, as: :new
    post '/create', action: :create, as: :create
    get '/:id/edit', action: :edit, as: :edit
    patch '/:id/update', action: :update, as: :update
    delete '/:id/destroy', action: :destroy, as: :destroy
  end

  # Operations
  namespace :operations  do
    get '/history', action: :history, as: :history
    post '/check_in/:employee_id', action: :check_in, as: :check_in
    post '/check_out/:employee_id', action: :check_out, as: :check_out
  end
end
