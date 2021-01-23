module ApplicationHelper

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def is_admin?
        current_user.admin == true
    end

    def user_movies
        @movies = Movie.where(user_id: session[:user_id])
        @movies.each do |one|
            if one.nil?
                "No movies yet"
            else
                one
            end 
        end
    end

    def user_rankings
        ranking = @rankings.find_by(user_id: current_user)
        if ranking.nil?
            "No rankings yet"
        else 
            ranking
        end
    end

 
end
