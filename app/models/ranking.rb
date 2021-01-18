class Ranking < ApplicationRecord
    belongs_to :movie
    belongs_to :user
    validates  :editing, :cinematography, :acting, :special_effects, :sound, :plot, :effort, :watch_again, length: {within: 1..5, message: "Please choose between 1-5"}
    validates :movie, uniqueness: { scope: :user, message: "has already been ranked by you." }


end

def self.average
    @rankings.each do |key, value|
        @average = values.reject {|v| v.length > 1 }.sum
    end
end

# def movie
# def movie=
# def build_movie
# def movie_id
# def movie.id=