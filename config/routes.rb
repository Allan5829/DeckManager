Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #For sessions
  get 'users/signup', to: 'sessions#new', as: :signup #signup_path
  post 'signup', to: 'sessions#create' 
  get 'users/login', to: 'sessions#login', as: :login #login_path
  post 'login', to: 'sessions#logging_in' 
  get 'logout', to: 'sessions#logout' #logout_path

  resources :decks #index, new, create, edit, update, destroy

  root 'sessions#home' #testing purposes only, temporary
end
