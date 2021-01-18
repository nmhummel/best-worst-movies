class MoviesController < ApplicationController

    def index
        @movies = Movie.all
    end
    
    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to movie_path(:id)
        else
            render :new
        end
    end

    def show
        #byebug
        @movie = Movie.find(params[:id])
    end

    def edit
        @movie = Movie.find(params[:id])
        @ranking = @movie.rankings.build(user_id: current_user.id) #????
        
    end

    def update
        @movie = Movie.find(params[:id])
        @movie.update(movie_params)
        redirect_to @movie
    end



    private

    def movie_params
        params.require(:movie).permit(:title, :year, :rating, :runtime, :genre, :summary, :poster)
    end

 

end
