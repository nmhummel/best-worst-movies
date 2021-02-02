class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  
    def index
        @users = User.abc
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            render :new
          end
      end

    def show
        redirect_if_not_logged_in
        @user_movies = Movie.where(user_id: @user.id)
    end

    def edit
      if @user != current_user
        flash[:message] = "Not your profile, so you can't edit it."
        redirect_to user_path
      end
     
    end

    def update
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit 
      end
    end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :best_worst_movie, :admin, :avatar, rankings_attributes: [:editing, :cinematography, :acting, :special_effects, :sound, :plot, :effort, :watch_again, :comments, :average])
  end

  def find_user
    @user = User.find(params[:id])
  end

end
