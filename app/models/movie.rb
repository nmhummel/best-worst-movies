require '../../lib/movie_scraper.rb'

class Movie < ApplicationRecord
    belongs_to :user
    has_many :rankings
    has_one_attached :poster  #one associated image



    def self.new_from_imdb(url)
        movie = Movie.new
        #doc = Nokogiri::HTML(open(url))
        properties = MovieScraper.imdb(url)
        properties.each do |k,v|
            animal.send("#{k}=", v)
        end
      animal
    end

end


# def user
# def user=
# def build_user
# def brand_id
# def brand_id=