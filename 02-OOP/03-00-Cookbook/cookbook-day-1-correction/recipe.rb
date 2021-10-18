class Recipe
  attr_reader :name, :description, :prep_time, :done, :rating
  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @prep_time = attributes[:prep_time] ||= "10 min"
    @rating = attributes[:rating]
    @done = done || false
  end

  def mark_as_done!
    @done = true
  end
end
