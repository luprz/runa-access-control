Rails.application.routes.draw do
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Sessions
  namespace :sessions, path: :users do
    get '/sign_in', action: 'new'
    post '/create', action: 'create'
    delete '/sign_out', action: 'destroy'
  end
end
