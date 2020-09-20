class DecksController < ApplicationController 
    before_action :logged_in?, except: [:public_deck, :show]

    def index
        
    end 

    def show
        @deck = Deck.find_by(id: params[:id])
        @note = UserDeck.find_by(:user_id => current_user.id, :deck_id => @deck.id)
        @deck_counts = @deck.get_card_counts
    end 

    def new
        Tournament.make_first_tournament
        @deck = Deck.new
        Deck.row("new").times { @deck.cards.build }
    end 

    def create
        @deck = Deck.new(deck_params)
        
        if @deck.save
            UserDeck.create(:user_id => current_user.id, :deck_id => @deck.id, :notes => user_deck_params)
            if current_user.admin == true
                redirect_to tournament_path(current_user.decks.last.tournament)
            else
                redirect_to user_deck_path(current_user, @deck)
            end  
        else
            render :new
        end  
    end 

    def edit
        @deck = Deck.find_by(id: params[:id])
        Deck.row("edit").times { @deck.cards.build }
    end 

    def update
        @deck = Deck.find_by(id: params[:id])
        @note = UserDeck.find_by(:user_id => current_user.id, :deck_id => @deck.id)

        if @deck.update(deck_params) 
            @note.notes = user_deck_params
            @note.save
            redirect_to user_deck_path(@deck)
        else
            render :edit
        end 
    end 

    def public_deck
        if params[:sort] == "Number of Users"
            @decks = Deck.most_users
        elsif params[:sort] == "Newest Created"
            @decks = Deck.newest_created
        elsif params[:sort] == "Oldest Created"
            @decks = Deck.oldest_created
        else 
            @decks = Deck.newest_created
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
        if params[:deck_id].present?
            Deck.row_increase("edit")
            redirect_to edit_user_deck_path(params[:deck_id])
        else
            Deck.row_increase("new")
            redirect_to new_user_deck_path
        end 
    end

    def remove_cards
        if params[:deck_id].present?
            Deck.row_decrease("edit")
            redirect_to edit_user_deck_path(params[:deck_id])
        else
            Deck.row_decrease("new")
            redirect_to new_user_deck_path
        end 
    end

    private

    def deck_params
        params.require(:deck).permit(:title, :shared, :player_name, :tournament_id, 
            :tournament_placement, 
        cards_attributes: 
        [
            :name,
            :count,
            :pokemon,
            :trainer,
            :basic_energy,
            :special_energy,
            :set_info,
            :id
        ])
    end 

    def user_deck_params
        params.require(:notes)
    end 

end 