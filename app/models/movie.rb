class Movie < ApplicationRecord
    has_many :rankings
    has_many :users, through: :rankings
    has_one_attached :poster  #one associated image
    scope :search_by_name, -> (search) { where("title LIKE ?", "%#{search}%")}
    
    #validate :duplicates
    #searchkick

 

    # def duplicates
    #     if Movie.find_by(:title)
    #         errors.add(:title, 'already exists in the database.')
    #     end
    # end

    # def self.best_worst
    #     order(avg: :desc)
    # end



end

