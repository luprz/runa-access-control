Rails.application.routes.draw do

  scope :api do
    scope :v1 do
      # Authentication
      mount_devise_token_auth_for 'User', at: 'users'
    end
  end

  namespace :api do
    namespace :v1 do
      # Control index
      get '/operations', to: 'operations#index', as: :index
      get '/operations/:id', to: 'operations#show', as: :show
      post '/operations/check_in', to: 'operations#check_in', as: :check_in
      post '/operations/check_out', to: 'operations#check_out', as: :check_out

      # Administrators
      resources :administrators do
        get '(page/:page)', action: :index, on: :collection, as: nil
        get '/employees', action: :employees, as: :employees
        get '/operations', action: :operations, as: :operations
      end

      # Employees
      resources :employees do
        get '(page/:page)', action: :index, on: :collection, as: nil
        get '/operations', action: :operations, as: :operations
      end
    end
  end
end
