class ApplicationController < ActionController::Base

    private 

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def require_admin
        return head(:forbidden) unless session.include? :admin_id
    end
end
