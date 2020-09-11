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
    end 

    def edit
    end 

    def update
    end 

    private

    def tournament_params
        params.require(:tournament).permit(:event_name, :event_date, :finished, :info)
    end 
    
end 