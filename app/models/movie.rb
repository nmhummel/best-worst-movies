class Movie < ApplicationRecord
    belongs_to :user
    has_many :rankings

end


# def user
# def user=
# def build_user
# def brand_id
# def brand_id=