class SessionsController < ApplicationController

    def new

    end

    def admin_new
        
    end

    def admin_create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password]) && @user.admin
            session[:user_id] = @user.id
            redirect_to admin_home_path
        else
            flash[:errors] = ["You failed to login as an admin."]
            redirect_to admin_login_path
        end
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to home_path
        else
            flash[:errors] = ["You failed to login!!! Loser."]
            redirect_to login_path
        end
    end

    def destroy
        session.delete :user_id
        flash[:notifications] = ["You've been logged out!"]
        redirect_to login_path
    end

end
