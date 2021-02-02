class MoviesController < ApplicationController
    include MoviesHelper
    before_action :find_movie, only: [:show, :edit, :update, :destroy]

    def index
        #byebug
        if params[:search]
            @movies = Movie.abc.search_by_name(params[:search])
        elsif params[:commit]
            @movies = Movie.top_ten
        else
            @movies = Movie.abc.all
        end
    end
    
    def new
        @movie = Movie.new
        @movie.rankings.build
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to movie_path(@movie)
        else
            render :new
        end
    end

    def show
        @rankings = @movie.rankings 

    end

    def edit
        @ranking = @movie.rankings.build(user_id: current_user.id) 
        
    end

    def update
        if @movie.update(movie_params)
            redirect_to @movie
        else
            render :edit  
        end
    end


    def top_ten 
        @movies = Movie.top_ten 
        render :index
    end

    def destroy
        @movie.destroy
        redirect_to movies_path
    end


    private

    def movie_params
        params.require(:movie).permit(:title, :year, :rating, :runtime, :genre, :summary, :poster, :user_id, rankings_attributes: [:user_id, :editing, :cinematography, :acting, :special_effects, :sound, :plot, :effort, :watch_again, :comments, :average])
    end

    def find_movie
        @movie = Movie.find(params[:id])
    end
 

end
