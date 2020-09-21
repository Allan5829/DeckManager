class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :admin_logged_in?, :get_user_id

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        if !session[:user_id]
            redirect_to '/'
        end
    end

    def admin_logged_in? # admin version of logged_in?
        if current_user
            if !current_user.admin
                redirect_to '/'
            end
        else
            redirect_to '/'
        end
    end 

    def get_user_id(deck) # returns first user id of deck.users
        ud = UserDeck.find_by(:deck_id => deck.id)
        if ud
            ud.user_id
        else
            0
        end 
        
    end 

end
