require "open-uri"
require "nokogiri"

require_relative "recipe"
class ScrapperService

  def initialize(ingredient)
    @ingredient = ingredient
    @base_url = "https://www.allrecipes.com/search/results/?search=#{ingredient}"
  end

  def call
    recipes = []
    page = URI.open(@base_url).read
    doc = Nokogiri::HTML(page)

    doc.search(".card__recipe").first(5).each do |card_recipe|
      name = card_recipe.search(".card__title").text.strip
      description = card_recipe.search(".card__summary").text.strip
      rating = card_recipe.search(".review-star-text").text.strip.split(" ")[1].to_f
      link = card_recipe.search(".card__titleLink").attribute("href").value
      
      next_page_doc = Nokogiri::HTML(URI.open(link).read)
      prep_time = next_page_doc.search(".recipe-meta-item-body").first.text.strip.split(" ").first 

      recipes << Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    end

    recipes 
  end
end

