class AdminsController < ApplicationController
    before_action :admin_logged_in?

    def admin_home
    end 

    def delete_deck # this is the only action that destroys a deck
        @deck = Deck.find_by(id: params[:id])
        @deck.admin_deck_delete
        redirect_to admin_path(current_user)
    end 
    
end 