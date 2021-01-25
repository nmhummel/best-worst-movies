class RankingsController < ApplicationController
    include RankingsHelper
    
    def index
        if params[:movie_id]
            @movie = Movie.find_by_id(params[:movie_id])
            @rankings = @movie.rankings
        else 
            @rankings = Ranking.all
        end
    end

    def new
        if current_user 
            if @movie = Movie.find_by_id(params[:movie_id])
                @ranking = @movie.rankings.build
            else
                @ranking = Ranking.new
            end
        else
            redirect_to login_path, flash: { message: "Please login to review movies." }
        end
    end

    def create
        @movie = Movie.find_by_id(params[:movie_id])
        @ranking = current_user.rankings.build(ranking_params)
        if @ranking.save
            redirect_to movie_path(@movie)
        else
            render :new, flash: { message: "Sorry-- rankings were not saved. Please try again" }
        end
    end

    def show
        @ranking = Ranking.find_by_id(params[:id])
        
    end

    def destroy
        @ranking = Ranking.find(params[:id])
        @ranking.destroy
        redirect_to '/'
    end

    private
    
    def ranking_params
        params.require(:ranking).permit(:editing, :cinematography, :acting, :special_effects, :sound, :plot, :effort, :watch_again, :comments, :movie_id, :user_id)
    end


end
