Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #For sessions
  get 'users/signup', to: 'sessions#signup', as: :signup #signup_path
  post 'users/signup', to: 'sessions#signing_up', as: :signup_post #signup_post_path
  get 'users/login', to: 'sessions#login', as: :login #login_path
  post 'users/login', to: 'sessions#logging_in', as: :login_post #login_post_path
  get 'logout', to: 'sessions#logout' #logout_path

  resources :decks #index, new, create, edit, update, destroy

  root 'sessions#home' #testing purposes only, temporary

  get '/auth/facebook/callback' => 'sessions#facebook_create'
  get '/auth/:provider/callback', to: 'sessions#github_create'
  get '/app/:provider/callback', to: 'sessions#github_create'
end
