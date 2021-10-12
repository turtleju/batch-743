require 'open-uri'
require 'nokogiri'

def fetch_movies_url
  url = "https://www.imdb.com/chart/top"
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)

  result = []
  html_doc.search('.titleColumn a').first(5).each do |element|
    # https://www.imdb.com/title/tt0111161/
    result << "https://www.imdb.com#{element.attribute('href').value}"
  end

  result
end

def scrape_movie(url)
  html_file = URI.open(url, "Accept-Language" => "en-US").read
  html_doc = Nokogiri::HTML(html_file)
  result = {}

  # set casting
  cast = []
  html_doc.search('.ipc-metadata-list__item:contains("Stars") a.ipc-metadata-list-item__list-content-item').each do |element|
    # remplir notre hash
    cast << element.text.strip
  end
  result[:cast] = cast.uniq

  director = html_doc.search('.ipc-metadata-list__item:contains("Director") a.ipc-metadata-list-item__list-content-item').first.text.strip
  result[:director] = director


  storyline = html_doc.search('.GenresAndPlot__TextContainerBreakpointXL-cum89p-2.gCtawA').first.text.strip
  result[:storyline] = storyline

  title = html_doc.search('.TitleHeader__TitleText-sc-1wu6n3d-0').first.text.strip
  result[:title] = title

  year = html_doc.search('.TitleBlockMetaData__StyledTextLink-sc-12ein40-1').first.text.strip
  result[:year] = year.to_i
  result
end
