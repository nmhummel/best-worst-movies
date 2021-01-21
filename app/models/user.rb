class User < ApplicationRecord
    has_many :rankings
    #has_many :movies, through: :rankings
    accepts_nested_attributes_for :rankings
    has_many :ranked_movies, through: :rankings, source: :movie
    # user.movies => user.ranked_movies
    has_secure_password
    has_one_attached :avatar  #one associated image
    validates :username, presence: true, uniqueness: { message: "%{value} is already in use.  Please select another or login."}
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence: true, uniqueness: { message: "%{value} is already in use.  Please select another or login."}

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end

end
