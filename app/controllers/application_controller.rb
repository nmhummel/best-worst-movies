class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    include ApplicationHelper

    def verified_user
        redirect_to '/' unless user_is_authenticated
    end
    
    def require_login
        return redirect_to(controller: 'session', action: 'new') unless user_is_authenticated
    end

    def handle_record_not_found
        # Send it to the view that is specific for Post not found
        redirect_to 'not_found'
    end


    def user_params
        params.require(:user).permit(:username, :email, :password, :best_worst_movie, :admin, :avatar)
    end
  
    def movie_params
      params.require(:movie).permit(:title, :year, :rating, :runtime, :genre, :summary, :poster)
    end

    


end
