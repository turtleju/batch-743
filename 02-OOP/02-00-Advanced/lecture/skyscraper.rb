require_relative 'building'

class Skyscraper < Building
  def initialize(name, ruler)
    @name, @ruler = name, ruler
  end

  def details
    puts self.class
    puts self.name

    "#{@name} is ruled by #{self.ruler_name}"
  end

  def ruler_name
    @ruler.capitalize
  end
end
