class AdminsController < ApplicationController
    before_action :admin_logged_in?, except: [:login, :logging_in]

    def login
    end 

    def logging_in
        @user = User.find_by(name: params[:user][:name], email: params[:user][:email])
        @user = @user.try(:authenticate, params[:user][:password])

        if @user
            if @user.admin == true
                session[:user_id] = @user.id
                redirect_to admin_path(@user)
            else
               redirect_to login_path 
            end 
        else
            render :login
        end
    end

    def delete_deck
        @deck = Deck.find_by(id: params[:id])
        @deck.admin_deck_delete
        redirect_to admin_path(current_user)
    end 
end 