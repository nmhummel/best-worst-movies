class RankingsController < ApplicationController

    def new
        #@ranking = ranking.new
    end

    def create
        @ranking = ranking.create(ranking_params)
        # redirect_to @ranking.user, alert: @ranking.take_ranking
         
        message = @ranking.give_ranking
        redirect_to @ranking.user, flash: { message: message }
    end


    def edit
        redirect_to ranking_path
    end
    
    private
    def ranking_params
        params.require(:ranking).permit(:editing, :cinematography, :acting, :special_effects, :sound, :plot, :effort, :watch_again, :comments, :movie_id)
    end


end
