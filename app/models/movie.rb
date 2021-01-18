class Movie < ApplicationRecord
    has_many :rankings
    has_many :users, through: :rankings
    has_one_attached :poster  #one associated image



    # def self.new_from_imdb(url)
    #     movie = Movie.new
    #     #doc = Nokogiri::HTML(open(url))
    #     properties = MovieScraper.imdb(url)
    #     properties.each do |k,v|
    #         movie.send("#{k}=", v)
    #     end
    #   movie
    # end

end

