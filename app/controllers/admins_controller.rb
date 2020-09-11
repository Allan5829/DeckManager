class AdminsController < ApplicationController
    before_action :admin_logged_in?

    def delete_deck
        @deck = Deck.find_by(id: params[:id])
        @deck.admin_deck_delete
        redirect_to admin_path(current_user)
    end 
    
end 