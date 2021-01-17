class User < ApplicationRecord
    has_many :movies
    has_many :rankings, through: :movies
    has_secure_password
    has_one_attached :avatar  #one associated image
    validates :password, presence: true
    validates :username, presence: true, uniqueness: { message: "%{value} is already in use.  Please select another or login."}
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence: true, uniqueness: { message: "%{value} is already in use.  Please select another or login."}

end
