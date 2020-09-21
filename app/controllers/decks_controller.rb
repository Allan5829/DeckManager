class DecksController < ApplicationController 
    before_action :logged_in?, except: [:public_deck, :show]

    # Every visitor has access to these actions
    
    def public_deck # Shows all public decks
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
    
    def show # Shows an indvidual deck
        @deck = Deck.find_by(id: params[:id])
        @note = UserDeck.find_by(:user_id => current_user.id, :deck_id => @deck.id) if current_user
        @deck_counts = @deck.get_card_counts
    end

    # Only logged in visitors have access to these actions

    def index # Shows all decks belonging to that user
    end 

    def new
        Tournament.make_first_tournament
        @deck = Deck.new
        Deck.row("new").times { @deck.cards.build }
    end 

    def create
        @deck = Deck.new(deck_params)

        if @deck.save && UserDeck.create(
                :user_id => current_user.id, :deck_id => @deck.id, :notes => user_deck_params)
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

        if @deck.update(deck_params) && @note.update(:notes => user_deck_params)
            redirect_to user_deck_path(@deck)
        else
            render :edit
        end 
    end 

    def copy_deck # Action that adds this user to the deck's collection of users
        @deck = Deck.find_by(id: params[:id])
        UserDeck.create(:user_id => current_user.id, :deck_id => @deck.id)
        redirect_to user_deck_path(get_user_id(@deck), @deck.id)
    end 

    def delete_deck # Action that removes this user from this deck's collection of users
        @deck = Deck.find_by(id: params[:id])
        user_deck = UserDeck.find_by(:user_id => current_user.id, :deck_id => @deck.id)
        user_deck.destroy

        redirect_to user_path(current_user)
    end 

    def edit_notes # Edits notes for the specific User and Deck
        @deck = Deck.find_by(id: params[:deck_id])
        @note = UserDeck.find_by(:user_id => current_user.id, :deck_id => @deck.id)

        if @note.update(:notes => user_deck_params)
            redirect_to user_deck_path(get_user_id(@deck), @deck.id)
        else
            render :show
        end 
    end 

    def add_cards # Allows new/edit to build more cards (children) for a deck (parent)
        if params[:deck_id].present?
            Deck.row_increase("edit")
            redirect_to edit_user_deck_path(params[:deck_id])
        else
            Deck.row_increase("new")
            redirect_to new_user_deck_path
        end 
    end

    def remove_cards # Allows new/edit to build less cards (children) for a deck (parent)
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