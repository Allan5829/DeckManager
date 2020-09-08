class DecksController < ApplicationController 

    def index
        @decks = Deck.where(shared: true)
    end 

    def show
        @deck = Deck.find_by(id: params[:id])
    end 

    def new
        Tournament.make_first_tournament
        @deck = Deck.new
        Deck.row.times { @deck.cards.build }
    end 

    def create
        @deck = Deck.new(deck_params)

        #binding.pry
        if @deck.save
            UserDeck.create(:user_id => current_user.id, :deck_id => @deck.id) 
            #check if this ^ can be refactored

            redirect_to user_path(current_user) 
        else
            render :new
        end  
    end 

    def edit
        @deck = Deck.find_by(id: params[:id])
    end 

    def update
        @deck = Deck.find_by(id: params[:id])

        if @deck.update(deck_params)
            redirect_to deck_path(@deck)
        else
            render :edit
        end 
    end 

    def copy_deck #method for a user to save a deck
        @deck = Deck.find_by(id: params[:id])
        UserDeck.create(:user_id => current_user.id, :deck_id => @deck.id)
        redirect_to user_path(current_user)
    end 

    def delete_deck #method for a user to delete deck from their collection of decks
        @deck = Deck.find_by(id: params[:id])
        user_deck = UserDeck.find_by(:user_id => current_user.id, :deck_id => @deck.id)
        user_deck.destroy

        redirect_to user_path(current_user)
    end 

    def add_cards
        Deck.row_increase
        redirect_to new_deck_path
    end

    def remove_cards
        Deck.row_decrease
        redirect_to new_deck_path
    end

    private

    def deck_params
        params.require(:deck).permit(:title, :description, :shared, :player_name, :tournament_id, 
        cards_attributes: 
        [
            :name,
            :count,
            :pokemon,
            :trainer,
            :basic_energy,
            :special_energy,
            :set_info
        ])
    end 

end 