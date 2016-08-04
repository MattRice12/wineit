Rails.application.routes.draw do
  resources :userwines
  resources :wines

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get '/signup' => 'users#new'

  resources :users do
    post '/userwines' => "users#userwines", on: :member
  end ###?????? What's this do?

  delete '/userwines' => "userwines#destroy"

  post 'sessions/authenticate'

  root 'wines#index'

end
