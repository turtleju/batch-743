puts 'Welcome to the race !'

balance = 100
win_race = 50
lose_race = 10
answer = 'y'
puts "Your balance is : #{balance} €"

while balance >= 10 && answer == 'y'
  # Display horses of the race
  horses = ['Affirmed', 'All Along', 'Alleged', 'Allez France']
  horses.each_with_index do |horse, index|
    puts "#{index + 1} - #{horse}"
  end

  # Bet on one horse
  puts 'On which horse you want to bet ?'
  index_horse_betted = gets.chomp.to_i
  horse_betted = horses[index_horse_betted - 1]
  puts "You bet on horse #{horse_betted}"

  # Run the race
  puts "The race is running"
  horse_winner = horses.sample
  puts "Winner is : #{horse_winner}"

  # Print the result
  if horse_betted == horse_winner
    balance += win_race
    puts 'You win !'
  else
    balance -= lose_race
    puts 'You lose !'
  end

  # Ask if continue
  puts "Your balance is : #{balance} €"
  puts "Do you want to continue ? [y/n]"
  answer = gets.chomp
end

puts 'Goodbye !'
puts "Your balance is #{balance}"
