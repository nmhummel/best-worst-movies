class Movie < ApplicationRecord
    belongs_to :user
    has_many :rankings
    has_one_attached :poster  #one associated image
end


# def user
# def user=
# def build_user
# def brand_id
# def brand_id=