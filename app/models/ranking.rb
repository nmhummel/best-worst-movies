class Ranking < ApplicationRecord
    belongs_to :movie
    belongs_to :user
    validates :editing, :cinematography, :acting, :special_effects, :sound, :plot, :effort, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: ": please choose between 1-5"}
    validates :comments, presence: true
    validates :movie, uniqueness: { scope: :user, message: "has already been ranked by you." }
    before_save :overall_average
    scope :avg_editing, -> {self.average(:editing).round(1)}
    scope :avg_cinematography, -> {self.average(:cinematography).round(1)}
    scope :avg_acting, -> {self.average(:acting).round(1)}
    scope :avg_special_effects, -> {self.average(:special_effects).round(1)}
    scope :avg_sound, -> {self.average(:sound).round(1)}
    scope :avg_plot, -> {self.average(:plot).round(1)}
    scope :avg_effort, -> {self.average(:effort).round(1)}
    scope :avg_average, -> {self.average(:average).round(1)} 
 
    
    def overall_average
        numbers = self.attributes.reject{|k,v| v.class != Integer || k.include?("id") || k == "average"}
        self.average = numbers.values.sum.to_f / 7       
    end
 
  

end

