Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      # Authentication
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  namespace :api do
    namespace :v1 do
      # Control index
      get '/control', to: 'control#index', as: :index
    end
  end
end
