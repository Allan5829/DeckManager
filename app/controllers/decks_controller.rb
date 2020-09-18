class DecksController < ApplicationController 
    before_action :logged_in?, except: [:index, :show]

    def index
        @d = Deck.where(shared: true)
        @decks = Deck.sort_decks(params[:sort], @d) 
    end 

    def show
        @deck = Deck.find_by(id: params[:id])
        @deck_counts = @deck.get_card_counts
    end 

    def new
        Tournament.make_first_tournament
        @deck = Deck.new
        Deck.row("new").times { @deck.cards.build }
    end 

    def create
        @deck = Deck.new(deck_params)
        #binding.pry
        if @deck.save
            current_user.decks << @deck
            if current_user.admin == true
                redirect_to tournament_path(current_user.decks.last.tournament)
            else
                redirect_to user_path(current_user)
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

        if @deck.update(deck_params)
            redirect_to user_deck_path(@deck)
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
        params.require(:deck).permit(:title, :description, :shared, :player_name, :tournament_id, 
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

end 