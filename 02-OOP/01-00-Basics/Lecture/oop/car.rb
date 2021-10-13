# rules to create a class

# 1 file per class

# file_name <=> classname
# lower_snake_case <=> UpperCamelCase
# car.rb    <=> Car
# sports_car.rb    <=> SportsCar

class Car
  attr_accessor :color

  # constructor, only call when instantiate
  def initialize(color)
    @color = color
    @engine_started = false
  end

  def engine_started?
    return @engine_started
  end

  def start_engine
    start_fuel_pump
    init_spark_plug
    @engine_started = true
  end

  private

  def start_fuel_pump
    puts 'start_fuel_pump'
  end

  def init_spark_plug
    puts "Init init_spark_plug"
  end
end
