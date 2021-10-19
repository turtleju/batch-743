require_relative 'patient'

class Room
  class NoRoomInTheRoomError < StandardError; end

  attr_accessor :id

  def initialize(attributes = {})
    @color    = attributes[:color]
    @capacity = attributes[:capacity] || 2
    @patients = attributes[:patients] || []
  end

  def full?
    @capacity == @patients.size
  end

  def add_patient(patient)
    if full?
      raise NoRoomInTheRoomError, "There is no capcity left in the room"
    else
      @patients << patient
      patient.room = self
      puts "#{patient.name} has been added to the #{@color} room"
    end
  end
end

toto = Patient.new(name: 'toto')
tutu = Patient.new(name: 'tutu')
tete = Patient.new(name: 'tete')

red = Room.new(color: 'red', capacity: 1)
blue = Room.new(color: 'blue', capacity: 1)

red.add_patient(toto)
blue.add_patient(tete)
p toto.room
red.add_patient(tutu)
# blue = Room.new(capacity: 3, color: 'blue')

# p blue.color
