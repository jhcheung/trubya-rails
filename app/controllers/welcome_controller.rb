class WelcomeController < ApplicationController
    def home
        @user = User.find_by id: session[:user_id]
    end

    def admin_home
        if @logged_in_user && @logged_in_user.admin
            @user = User.find_by id: session[:user_id]
            render 'admin_home'
        else 
            flash[:error] = "You are not authorized to go there!"
            redirect_to login_path
        end
    end
end
