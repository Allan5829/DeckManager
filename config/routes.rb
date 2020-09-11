Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #For sessions
  get 'user/signup', to: 'sessions#signup', as: :signup #signup_path
  post 'user/signup', to: 'sessions#signing_up', as: :signup_post #signup_post_path
  get 'user/login', to: 'sessions#login', as: :login #login_path
  post 'user/login', to: 'sessions#logging_in', as: :login_post #login_post_path
  get 'logout', to: 'sessions#logout' #logout_path

  get 'user/home/:id', to: 'sessions#user_home', as: :user #user_path

  get '/auth/facebook/callback', to: 'sessions#facebook_create'
  get '/auth/github/callback', to: 'sessions#github_create'  

  root 'sessions#home' #testing purposes only, temporary  

  resources :decks, except: :destroy #index, new, create, edit, update

  get 'decks/:id/copy', to: 'decks#copy_deck', as: :copy_deck #copy_deck_path(deck)
  get 'decks/:id/delete', to: 'decks#delete_deck', as: :delete_deck #delete_deck_path(deck)

  post 'decks/add_cards', to: 'decks#add_cards', as: :add_card #add_card_path
  post 'decks/remove_cards', to: 'decks#remove_cards', as: :remove_card #remove_card_path

  get 'admin/home/:id', to: 'admins#admin_home', as: :admin #admin_path
  get 'admin/decks/:id/delete', to: 'admins#delete_deck', as: :admin_delete_deck 
    #admin_delete_deck_path(deck)

end
