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
      post '/operations/check', to: 'operations#check', as: :check

      # Administrators
      resources :administrators do
        get '(page/:page)', action: :index, on: :collection, as: nil
      end

      # Employees
      resources :employees do
        get '(page/:page)', action: :index, on: :collection, as: nil
      end
    end
  end
end
