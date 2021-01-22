class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
         # if (user = User.create(user_params))
            session[:user_id] = @user.id
            @user.avatar.purge
            @user.avatar.attach(params[:user][:avatar])
            redirect_to user_path(@user)
          else
            render :new
          end
      end

    def show
        if user_is_authenticated
          @user = User.find(params[:id])
          @movies = Movie.all
          @rankings = Ranking.all
        else
          redirect_to '/'
        end
    end

    def edit
      #byebug
      @user = User.find(params[:id])

      #@ranking = @movie.rankings.build(user_id: current_user.id) #????

    end

    def update
      @user = User.find(params[:id])
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


end
