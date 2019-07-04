Rails.application.routes.draw do

  scope :api do
    scope :v1 do
      # Authentication
      devise_for :user, skip: [:passwords]
    end
  end

  namespace :api do
    namespace :v1 do
      # Control
      get '/control', to: 'control#index', as: :index
    end
  end
end
