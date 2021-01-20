class Ranking < ApplicationRecord
    belongs_to :movie
    belongs_to :user
    validates  :editing, :cinematography, :acting, :special_effects, :sound, :plot, :effort, :watch_again, length: {within: 1..5, message: "Please choose between 1-5"}
    validates :movie, uniqueness: { scope: :user, message: "has already been ranked by you." }


    def movie_attributes=(hash_of_attributes)
        # hash_of_attributes = {"title"=>"The Room", "year"=>"1999"}
        #find or create a movie based on the attributes sent in
        if !hash_of_attributes[:name].blank? && !hash_of_attributes[:year_founded].blank?
            self.movie = Movie.find_or_create_by(hash_of_attributes)
        end
    end

    # def self.average
    #     @rankings.each do |key, value|
    #         @average = values.reject {|v| v.length > 1 }.sum
    #     end
    # end

    # def editing
    #     @editing_avg = self.rankings.average(:editing) 
    # end

    # def cinematography
    #     @cinematography_avg = @rankings.average(:cinematography) 
    # end

    # def acting
    #     @acting_avg = @rankings.average(:acting) 
    # end

    # def special_effects
    #     @special_effects_avg = @rankings.average(:special_effects) 
    # end

    # def sound
    #     @sound_avg = @rankings.average(:sound) 
    # end

    # def plot
    #     @plot_avg = @rankings.average(:plot) 
    # end

    # def overall_average
    #     @average_avg = @rankings.average(:average) 
    # end

    # def watch_again
    #     @avg_rewatch = @rankings.select {|k,v| v == "true"}
    #     @avg_rewatch.count
    # end



end





# def movie
# def movie=
# def build_movie
# def movie_id
# def movie.id=