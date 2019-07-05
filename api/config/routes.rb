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
      get '/control/operations', to: 'control#index', as: :index
      resources :administrators do
        get '(page/:page)', action: :index, on: :collection, as: nil
      end
    end
  end
end
