class SessionsController < ApplicationController

    def omniauth
        user = User.from_omniauth(request.env['omniauth.auth'])
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = user.errors.full_messages.join
            redirect_to login_path
        end
    end

    def home
        @rando = Movie.find(rand(Movie.count))
    end

    def new
        @user = User.new
    end

    def create

        user = User.find_by_username(params[:user][:username])
        if user && user.try(:authenticate, params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:error] = "Sorry-- login info was incorrect. Please try again."
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
    
end
