class SessionsController < ApplicationController 

    def signup
        @user = User.new
    end 

    def signing_up
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :signup
        end  
    end 

    def login
    end 

    def logging_in
        user = User.find_by(name: params[:user][:name])
        user = user.try(:authenticate, params[:user][:password])
        if user
            #@user = user
            session[:user_id] = user.id
            redirect_to root_path
        else
            render :login
        end
    end 

    def logout
        session.clear
        redirect_to '/'
    end 

    def home #testing purposes only, temporary
    end 

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :admin)
    end

end