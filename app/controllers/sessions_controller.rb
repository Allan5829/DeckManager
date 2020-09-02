class SessionsController < ApplicationController 

    def signup
    end 

    def signing_up
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end  
    end 

    def login
    end 

    def logging_in
    end 

    def logout
    end 

    def home #testing purposes only, temporary
    end 

    def user_params
        params.require(:user).permit(:name, :email, :password, :admin)
    end

end