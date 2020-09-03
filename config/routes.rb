Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #For sessions
  get 'user/signup', to: 'sessions#signup', as: :signup #signup_path
  post 'user/signup', to: 'sessions#signing_up', as: :signup_post #signup_post_path
  get 'user/login', to: 'sessions#login', as: :login #login_path
  post 'user/login', to: 'sessions#logging_in', as: :login_post #login_post_path
  get 'logout', to: 'sessions#logout' #logout_path

  get 'user/home/:id', to: 'sessions#user_home', as: :user #user_path

  resources :decks #index, new, create, edit, update, destroy

  root 'sessions#home' #testing purposes only, temporary

  get '/auth/facebook/callback' => 'sessions#facebook_create'
  get '/auth/github/callback', to: 'sessions#github_create'
end
