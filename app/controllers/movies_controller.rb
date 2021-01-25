class MoviesController < ApplicationController
    include MoviesHelper

    # def search
    #     if params[:search].present?
    #       @movies = Movie.search(params[:search])
    #     else
    #       @movies = Movie.all
    #     end
    #   end

    def index
        if params[:search]
            @movies = Movie.abc.search_by_name(params[:search])
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
        @rankings = @movie.rankings #.order_by_average

    end

    def edit
        @movie = Movie.find(params[:id])
        @ranking = @movie.rankings.build(user_id: current_user.id) #????
        
    end

    def update
        @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
            @movie.poster.purge
            @movie.poster.attach(params[:movie][:poster])
        end  
        redirect_to @movie
    end


    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to movies_path
    end


    private

    def movie_params
        params.require(:movie).permit(:title, :year, :rating, :runtime, :genre, :summary, :poster, :user_id, rankings_attributes: [:user_id, :editing, :cinematography, :acting, :special_effects, :sound, :plot, :effort, :watch_again, :comments, :average])
    end

 

end
