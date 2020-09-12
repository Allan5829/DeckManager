class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :admin_logged_in?

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        if !session[:user_id]
            redirect_to '/'
        end
    end

    def admin_logged_in?
        if current_user
            if !current_user.admin
                redirect_to '/'
            end
        else
            redirect_to '/'
        end
    end 

end
