class UsersController < ApplicationController 
    before_action :logged_in?

    def show # Home page for all users who aren't admins
    end 

end 