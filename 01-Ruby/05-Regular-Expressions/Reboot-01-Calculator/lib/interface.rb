require_relative 'calculator'

# Hello , welcome !
puts 'Welcome in calculator'
answer = 'y'
while answer == 'y'
  # Ask for first number
  puts 'First number ?'
  # Register first number
  first_number = gets.chomp.to_i
  # Ask for second number
  puts 'Second number ?'
  # Register second number
  second_number = gets.chomp.to_i
  # Ask for operator
  puts "Which operation [+][-][*][/]"
  operator = gets.chomp
  # Calculate
  result = calculator(first_number, second_number, operator)

  # Display result
  puts "Result: #{result}"
  puts "Do you want to continue ? [y/n]"
  answer = gets.chomp
end
