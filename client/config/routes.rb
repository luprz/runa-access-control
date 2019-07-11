Rails.application.routes.draw do
  get 'operation/check'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Sessions
  namespace :sessions, path: :users do
    get '/sign_in', action: :new
    post '/create', action: :create
    delete '/sign_out', action: :destroy
  end

  # Employees
  namespace :employees, path: :members do
    get '/:id/profile', action: :show, as: :show
    get '/new', action: :new, as: :new
    post '/create', action: :create, as: :create
    get '/:id/edit', action: :edit, as: :edit
    patch '/:id/update', action: :update, as: :update
    delete '/:id/destroy', action: :destroy, as: :destroy
    post '/:id/check', action: :check, as: :check
  end

  # Employees
  namespace :operations  do
    get '/history', action: :history, as: :history
    post '/check/:employee_id', action: :check, as: :check
  end
end
