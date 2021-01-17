module ApplicationHelper

    def current_user
        current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def user_is_authenticated
        !!current_user
    end
    
end
