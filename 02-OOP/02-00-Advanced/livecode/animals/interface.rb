require_relative 'animal'
require_relative 'lion'
require_relative 'meerkat'
require_relative 'warthog'

#In another Ruby file, create an array with Simba,
#Nala, Timon & Pumbaa, iterate over it and
#puts the sound each animal make

animals = [
  Lion.new('Simba'),
  Lion.new('Nala'),
  Meerkat.new('Timon'),
  Warthog.new('Pumbaa')
]

animals.each do |animal|
  puts animal.talk
end

animals.class #=> array
animals[2].class #=> 'Meerkat'

timon = animals[2]
timon.eat('banana')
p animals[2].eat('banana')
