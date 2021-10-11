# 1. Print Welcome
puts "Welcome !"
# 2. Define your store (what items are for sale?)
shop = {
  "kiwi" => 1.25,
  "banana" => 0.5,
  "mango" =>  4,
  "asparagus" => 9
}
shop.each do |fruit, price|
  puts "#{fruit}: #{price} €"
end
# 3. Get items from the user (shopping)

fruit_selected = ''
cart = {}
while fruit_selected != 'quit'
  # ask user for item
  puts "Which item? (or 'quit' to checkout)"
  fruit_selected = gets.chomp
  if shop[fruit_selected]
    puts "Which quantity ?"
    quantity = gets.chomp.to_i

    if cart.key?(fruit_selected)
      cart[fruit_selected] += quantity
    else
      cart[fruit_selected] = quantity
    end
  elsif fruit_selected != 'quit'
    puts 'Not in store'
  end
end

# calculate total
total = 0
cart.each do |fruit, quantity|
  price_one_fruit = shop[fruit]
  total += quantity * price_one_fruit
end

# 4. Print the bill (checkout)
puts "-------BILL---------"
cart.each do |fruit, quantity|
  puts "#{fruit}: #{quantity} X #{shop[fruit]}€ = #{quantity * shop[fruit]}€"
end

puts "TOTAL: #{total}€"
puts "--------------------"
