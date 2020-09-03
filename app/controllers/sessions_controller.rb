class SessionsController < ApplicationController 
    #skip_before_action :verify_authenticity_token, only: :create

    def signup
        @user = User.new
    end 

    def signing_up
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :signup
        end  
    end 

    def login
    end 

    def logging_in
        @user = User.find_by(name: params[:user][:name])
        @user = @user.try(:authenticate, params[:user][:password])
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :login
        end
    end 

    def logout
        session.clear
        redirect_to '/'
    end 

    def user_home
    end 

    def facebook_create
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
        end
       
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end 

    def github_create
        @user = User.find_or_create_from_auth(request.env['omniauth.auth'])

        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :signup
        end
      end

    def home #testing purposes only, temporary
    end 

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :admin, :uid)
    end

    def auth
        request.env['omniauth.auth']
    end

end