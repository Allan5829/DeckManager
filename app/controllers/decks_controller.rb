class DecksController < ApplicationController 

    def index
    end 

    def show
    end 

    def new
        @deck = Deck.new
    end 

    def create
    end 

    def edit
    end 

    def update
    end 

    def destroy
    end

    private

    def deck_params
        params.require(:deck).permit(:title, :description, :shared, :player_name)
    end 

end 