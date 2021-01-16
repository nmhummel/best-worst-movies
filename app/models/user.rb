class User < ApplicationRecord
    has_many :movies
    has_many :rankings, through: :movies
    
end
