require_relative 'slot_machine'

new_machine = SlotMachine.new(%w[joker star star])

p new_machine.score #=> 15

p new_machine.reels #=> ['star', 'bell', 'seven']
new_machine.play
p new_machine.reels #=> joker, bell, star

p new_machine.score #=> 20
