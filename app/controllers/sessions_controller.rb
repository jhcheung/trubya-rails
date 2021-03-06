class SessionsController < ApplicationController
    def new
        if @logged_in_user
            flash[:errors] = ["You are already logged in! You do not need to sign up"]
            redirect_to root_path
        end
    end

    def admin_new
        if @logged_in_user && @logged_in_user.admin
            redirect_to admin_home_path
        end
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
            redirect_to root_path
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
