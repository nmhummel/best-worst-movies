class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include ApplicationHelper

    def current_user
        current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def user_is_authenticated
        !!current_user
    end

    def user_params
        params.require(:user).permit(:username, :email, :password, :best_worst_movie, :avatar, :admin)
    end

    
end
