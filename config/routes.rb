Rails.application.routes.draw do
  resources :userwines
  resources :wines
  resources :users
  post 'sessions/authenticate'
end
