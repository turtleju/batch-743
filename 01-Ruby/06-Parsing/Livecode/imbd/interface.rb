require_relative 'scraper'
require 'yaml'

# search 5 top films in imbd
top_films_urls = fetch_movies_url

movies = []
top_films_urls.each do |url|
  movies << scrape_movie(url)
end

File.open("movies.yml", "w") { |file| file.write(movies.to_yaml) }
