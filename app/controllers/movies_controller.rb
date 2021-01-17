class MoviesController < ApplicationController

    def index
        @movies = Movie.all
    end
    
    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.create(movie_params)
        if @movie.save
            redirect_to movie_path(:id)
        else
            render :new
        end
    end

    def show
        @movie = Movie.find("id")
    end

    def edit
        @movie = Movie.find(params[:movie][:id])
        @ranking = @movie.rankings.build(user_id: current_user.id) #????
    end

    def update
        @movie = Movie.find(params[:id])
        @movie.update(movie_params)
        redirect_to @movie
    end



    private

    def movie_params
        params.require(:movie).permit(:title, :genre, :rating, :year, :poster, :user_id)
    end

    def upload
        uploaded_file = params[:poster]
        File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
          file.write(uploaded_file.read)
        end
    end

end
