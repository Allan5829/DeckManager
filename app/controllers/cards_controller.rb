class CardsController < ApplicationController 

    def new
        @card = Card.new(deck_id: params[:deck_id])
        #binding.pry
    end 

    def create
    end 

    def edit
    end 

    def update
    end 

end 