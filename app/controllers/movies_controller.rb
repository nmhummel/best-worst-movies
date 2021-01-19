class MoviesController < ApplicationController

    # def search
    #     if params[:search].present?
    #       @movies = Movie.search(params[:search])
    #     else
    #       @movies = Movie.all
    #     end
    #   end

    def index
        if params[:search]
            @movies = Movie.search_by_name(params[:search])
        else
            @movies = Movie.all
        end
    end
    
    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            @movie.poster.purge
            @movie.poster.attach(params[:movie][:poster])
            redirect_to movie_path(@movie)
        else
            render :new
        end
    end

    def show
        #byebug
        @movie = Movie.find(params[:id])
        @rankings = @movie.rankings
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
