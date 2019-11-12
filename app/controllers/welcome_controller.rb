class WelcomeController < ApplicationController
    before_action :require_login
    before_action :require_admin, only: [:admin_home]

    def home
        @user = User.find_by id: session[:user_id]
    end

    def admin_home
        @user = User.find_by id: session[:user_id]
    end
end
