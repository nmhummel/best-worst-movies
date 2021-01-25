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

    def verified_user
        redirect_to '/' unless user_is_authenticated
    end
    
    def require_login
        return redirect_to(controller: 'session', action: 'new') unless user_is_authenticated
    end

    # def user_movies
    #     @movies = Movie.where(user_id: @user.id)
    #     @movies.each do |one|
    #         if one.nil?
    #             "No movies yet"
    #         else
    #             one
    #         end 
    #     end
    # end

    # def user_rankings
    #     @rankings = Ranking.where(user_id: @user.id)
    #     @rankings.each do |one|
    #         if one.nil?
    #             "No rankings yet"
    #         else
    #             one
    #         end 
    #     end
    # end
#byebug
    
    def user_movies
        @user_movies = Movie.where(user_id: @user.id)
        # @movies.each do |one|
        #     if one.nil?
        #         "No movies yet"
        #     else
        #         one
        #     end 
        # end
    end

    # def user_rankings
    #     #@user_rankings = @user.rankings.movie_id
    #     @user_rankings = Ranking.where(user_id: @user.id)

    # end


end
