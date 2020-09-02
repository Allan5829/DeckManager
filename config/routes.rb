Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #For sessions
  get '/users/signup', to: 'sessions#new', as: :signup 
  post '/signup', to: 'sessions#create' 
  get '/users/login', to: 'sessions#login', as: :login 
  post '/login', to: 'sessions#logging_in' 

  resources :decks #index, new, create, edit, update, destroy
end
