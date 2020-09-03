class DecksController < ApplicationController 

    def index
    end 

    def show
    end 

    def new
        @deck = Deck.new
    end 

    def create
        @deck = Deck.new(deck_params)

        if @deck.save
            UserDeck.create(:user_id => current_user.id, :deck_id => @deck.id) 
            #check if this ^ can be refactored

            redirect_to user_path(current_user) 
        else
            render :new
        end  
    end 

    def edit
    end 

    def update
    end 

    def destroy
    end

    private

    def deck_params
        params.require(:deck).permit(:title, :description, :shared, :player_name, :tournament_id)
    end 

end 