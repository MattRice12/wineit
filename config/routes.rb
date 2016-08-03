Rails.application.routes.draw do
  resources :userwines
  resources :wines

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :users do
    post '/userwines' => "users#userwines", on: :member
  end

  delete '/userwines' => "userwines#destroy"

  get 'sessions/sign_in', as: 'sign_in'
  delete 'sessions/sign_out', as: 'sign_out'
  post 'sessions/authenticate'

  root 'wines#index'

end
