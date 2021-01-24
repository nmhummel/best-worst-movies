class Movie < ApplicationRecord
    belongs_to :user
    has_many :rankings
    has_many :users, through: :rankings
    accepts_nested_attributes_for :rankings
    has_one_attached :poster  
    validates :title, presence: true, uniqueness: { message: "%{value} is already in the database."}
    scope :search_by_name, -> (search) { where("title LIKE ?", "%#{search}%")}
    scope :order_by_average, -> {Movie.left_joins(:rankings).group(:id).order('avg(average) desc')}
    
    def self.abc
        order(title: :asc).includes([poster_attachment: :blob])
    end

 

end

