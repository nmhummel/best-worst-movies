class Movie < ApplicationRecord
    has_many :rankings
    has_many :users, through: :rankings
    accepts_nested_attributes_for :rankings
    has_one_attached :poster  #one associated image
    validate :not_a_duplicate
    scope :search_by_name, -> (search) { where("title LIKE ?", "%#{search}%")}
    scope :order_by_average, -> {Movie.left_joins(:rankings).group(:id).order('avg(average) desc')}
    #searchkick

    def self.abc
        order(title: :asc)
    end

    def not_a_duplicate
        if Movie.find_by(title: title)
            errors.add(:title, 'already exists in the database.')
        end
    end

    # def self.best_worst
    #     order(avg: :desc)
    # end

 

end

