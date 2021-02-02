class WelcomeController < ApplicationController

    def home
        @rando = Movie.find(rand(Movie.count))
    end


end