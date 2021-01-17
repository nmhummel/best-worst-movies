class RankingsController < ApplicationController
# ranking belongs to movie
    def new
        if @movie = Movie.find_by_id(params[:movie_id])
            @ranking = @movie.rankings.build
        else
            @ranking = Ranking.new
        end
    end

    def create
        @ranking = current_user.rankings.build(ranking_params)
        if @ranking.save
            redirect_to ranking_path(@ranking)
        else
            render :new, flash: { message: "Sorry-- rankings were not saved. Please try again" }
        end
    end

    # def show
    #     @ranking = Ranking.find_by_id(params[:id])
    # end

    def index
        if params[:movie_id] #nested
            @movie = Movie.find_by_id(params[:movie_id])
            @review = @movie.rankings
        else #not nested
        @rankings = Ranking.all
    end

    # def edit
    #     redirect_to ranking_path
    # end
    
    private
    def ranking_params
        params.require(:ranking).permit(:editing, :cinematography, :acting, :special_effects, :sound, :plot, :effort, :watch_again, :comments, :movie_id)
    end


end
