Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      # Authentication
      devise_for :users, skip: [:passwords]
      get '/users/verify_token', to: 'devise/tokens#verify_token'
    end
  end

  namespace :api do
    namespace :v1 do
      # Control index
      get '/control', to: 'control#index', as: :index
    end
  end
end
