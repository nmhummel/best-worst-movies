require 'kimurai'

class MovieSpider < Kimurai::Base
  @name = "movie_spider"
  @engine = :mechanize
  @start_urls = ["https://www.imdb.com/list/ls003079409/"]
  @config = {}

  def parse(response, url:, data: {})

    item = {}

    item[:title] = response.xpath("//h3/[@class='lister-item-header']").text.squish
    item[:year] = response.xpath("//span[@class='lister-item-year text-muted unbold']").text.squish
    item[:rating] = response.xpath("//p[@class='text-muted text-small']/span[@class='certificate']").text
    item[:runtime] = response.xpath("//p[@class='text-muted text-small']/span[@class='runtime']").text.squish  
    item[:genre] = response.xpath("//p[@class='text-muted text-small']/span[@class='genre']").squish.split(",")
    item[:summary] = response.xpath("//p[@class='lister-item-content']/p/[@class='']").text.squish
    item[:poster] = response.xpath("//div[@class='lister-item-image ribbonize']")

    save_to "movie_results.json", item, format: :pretty_json


  end
end

MovieSpider.crawl!
