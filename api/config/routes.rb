Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/', to: 'control#index', as: :index
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
