class Ranking < ApplicationRecord
    belongs_to :movie
    belongs_to :user
    validates_length_of :rank_attr, within: 1..5, message: "Please choose between 1-5"
    
    def rank_attr
        Ranking.attribute_names
    end

end

# def movie
# def movie=
# def build_movie
# def movie_id
# def movie.id=