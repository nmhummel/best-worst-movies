class User < ApplicationRecord
    has_many :rankings
    accepts_nested_attributes_for :rankings
    has_many :ranked_movies, through: :rankings, source: :movie
    has_secure_password
    has_one_attached :avatar  
    validates :username, presence: true, uniqueness: { message: "%{value} is already in use.  Please select another or login."}
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence: true, uniqueness: { message: "%{value} is already in use.  Please select another or login."}

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end

    def self.abc
        order(username: :asc).includes([avatar_attachment: :blob])
    end

end
