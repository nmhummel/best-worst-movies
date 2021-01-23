class Ranking < ApplicationRecord
    belongs_to :movie
    belongs_to :user
    validates  :editing, :cinematography, :acting, :special_effects, :sound, :plot, :effort, :watch_again, length: {within: 1..5, message: "Please choose between 1-5"}
    validates :movie, uniqueness: { scope: :user, message: "has already been ranked by you." }
    before_save :overall_average
    scope :avg_editing, -> {self.average(:editing)}
    scope :avg_cinematography, -> {self.average(:cinematography)}
    scope :avg_acting, -> {self.average(:acting)}
    scope :avg_special_effects, -> {self.average(:special_effects)}
    scope :avg_sound, -> {self.average(:sound)}
    scope :avg_plot, -> {self.average(:plot)}
    scope :avg_effort, -> {self.average(:effort)}
    scope :avg_average, -> {self.average(:average)}
    scope :rewatch_avg, -> {self.where(watch_again: true).count / self.count }

  
    def overall_average
        #this takes overall score for the 7 categories
        numbers = self.attributes.reject{|k,v| v.class != Integer || k.include?("id") || k == "average"}
        self.average = numbers.values.sum.to_f / 7       
    end
 
    def rewatch_avg
        Ranking.where(watch_again: true).count * 100 / Ranking.count
    end




end





# def movie
# def movie=
# def build_movie
# def movie_id
# def movie.id=