module ApplicationHelper

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) #if session[:user_id]
    end

    def current_movie
        @current_movie ||= Movie.find_by_id(:id) 
    end

    def user_is_authenticated
        !!current_user
    end

    def admin
        if @current_user.admin == "true"
            puts "ADMIN"
        end
    end
    
end
