class Ranking < ApplicationRecord
    belongs_to :movie
    belongs_to :user
    validates  :editing, :cinematography, :acting, :special_effects, :sound, :plot, :effort, :watch_again, length: {within: 1..5, message: "Please choose between 1-5"}
    validates :movie, uniqueness: { scope: :user, message: "has already been ranked by you." }
    before_save :overall_average
    scope :avg_editing, -> {Ranking.editing.average}

    # Ranking.last
    # Ranking.last.overall_average

    def overall_average
        #byebug
        numbers = self.attributes.reject{|k,v| v.class != Integer || k.include?("id") || k == "average"}
        self.average = numbers.values.sum / numbers.size 
        
    end

    def avg_editing
        @editing_avg = self.rankings.average(:editing) 
    end

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