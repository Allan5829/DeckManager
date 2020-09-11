class TournamentsController < ApplicationController
    before_action :admin_logged_in?

    def index
        @tournaments = Tournament.all
    end 
    
    def show
        @tournament = Tournament.find_by(id: params[:id])
    end 

    def new
        @tournament = Tournament.new
    end 

    def create
        @tournament = Tournament.new(tournament_params)

        if @tournament.save
            redirect_to admin_path(current_user) 
        else
            render :new
        end
    end 

    def edit
        @tournament = Tournament.find_by(id: params[:id])
    end 

    def update
        @tournament = Tournament.find_by(id: params[:id])

        if @tournament.update(tournament_params)
            redirect_to tournament_path(@tournament)
        else
            render :edit
        end 
    end 

    private

    def tournament_params
        params.require(:tournament).permit(:event_name, :event_date, :finished, :info)
    end 
    
end 