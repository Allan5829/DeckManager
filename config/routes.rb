Rails.application.routes.draw do

  # Admin Routes
  get 'admin/home/:id', to: 'admins#admin_home', as: :admin #admin_path
  get 'admin/decks', to: 'admins#admin_decks'
  get 'admin/decks/:id/delete', to: 'admins#delete_deck', as: :admin_delete_deck 
    #admin_delete_deck_path(deck)

  # Deck Routes
  get 'decks/public', to: 'decks#public_deck'

  get 'decks/:id/copy', to: 'decks#copy_deck', as: :copy_deck #copy_deck_path(deck)
  get 'decks/:id/delete', to: 'decks#delete_deck', as: :delete_deck #delete_deck_path(deck)

  post 'decks/add_cards', to: 'decks#add_cards', as: :add_card #add_card_path
  post 'decks/remove_cards', to: 'decks#remove_cards', as: :remove_card #remove_card_path  

  # Session Routes
  get 'user/signup', to: 'sessions#signup', as: :signup #signup_path
  post 'user/signup', to: 'sessions#signing_up', as: :signup_post #signup_post_path

  get 'user/login', to: 'sessions#login', as: :login #login_path
  post 'user/login', to: 'sessions#logging_in', as: :login_post #login_post_path

  get 'logout', to: 'sessions#logout' #logout_path

  root 'sessions#home' #testing purposes only, temporary 

  match '/auth/github/callback', to: 'sessions#github_create', via: [:get, :post]

  # Tournament Routes
  resources :tournaments, except: :destroy

  # User Routes
  resources :users, only: :show do
    resources :decks, except: :destroy #index, new, create, edit, update
  end 

end
