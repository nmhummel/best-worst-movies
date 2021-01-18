require 'nokogiri'
require 'open-uri'

class MovieScraper

    def self.imdb(url)
        url = open("https://www.imdb.com/list/ls003079409/")
        doc = Nokogiri::HTML(url) 

        movie = {}

        movie[:title] = doc.search(".lister-item-header")
        movie[:year] = doc.search(".lister-item-year text-muted unbold").text
        movie[:rating] = doc.search(".text-muted text-small.certificate").text
        movie[:runtime] = doc.search(".text-muted text-small.runtime").text 
        movie[:genre] = doc.search(".text-muted text-small.genre").squish.split(",")
        movie[:summary] = doc.search(".lister-item-content.'']").text.squish
        movie[:poster] = doc.search(".lister-item-image ribbonize")

        animal
    end


end