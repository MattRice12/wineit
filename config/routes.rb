Rails.application.routes.draw do
  resources :userwines
  resources :wines

  resources :users do
    post 'userwines' => "users#userwines", on: :member
    delete 'userwines' => "users#userwines", on: :member
  end

  get 'sessions/sign_in', as: 'sign_in'
  delete 'sessions/sign_out', as: 'sign_out'
  post 'sessions/authenticate'

  post '/sign_up' => 'users#new', as: 'sign_up'

  root 'users#index'

end
