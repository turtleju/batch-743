require_relative 'building'
require_relative 'butler'

class Castle < Building
  attr_accessor :butler

  def initialize(name, width, length, butler_name)
    super(name, width, length)
    @butler = Butler.new(butler_name, self)
  end

  def has_a_butler?
    @butler != nil
  end

  def floor_area
    super + 300
  end
end
