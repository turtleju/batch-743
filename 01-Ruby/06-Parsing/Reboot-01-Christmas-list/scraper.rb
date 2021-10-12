require 'nokogiri'
### si je scrape depuis le web

#require 'open-uri'

#article = 'jeans'
#html_content = URI.open("https://www.etsy.com/search?q=#{article}").read

### fin scrap web


## Si je scrape en local

filepath = "results.html"
html_content = File.open(filepath)



## fin scrap local

doc = Nokogiri::HTML(html_content)

doc.search('.v2-listing-card__title').each do |element|
  puts element.text.strip
end
