class Animal
  def initialize(name)
    @name = name
  end

  def self.phyla
    %w[Bilateria Deuterostomia Ecdysozoa Lophotrochozoa]
  end

  def eat(food)
    "#{@name} eats a #{food}"
  end
end
