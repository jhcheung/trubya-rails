class ApplicationController < ActionController::Base
    before_action :login_check
    private 

    def login_check
        @notifications = flash[:notifications]
        @errors = flash[:errors]


        if session[:user_id]
            @logged_in_user = User.find session[:user_id]
        else 
            @logged_in_user = nil
        end
    end

end
