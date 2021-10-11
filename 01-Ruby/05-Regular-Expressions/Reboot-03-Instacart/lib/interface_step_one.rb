
# 1. Print Welcome
puts "Welcome !"
cart = []
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
total = 0
while fruit_selected != 'quit'
  # ask user for item
  puts "Which item? (or 'quit' to checkout)"
  fruit_selected = gets.chomp
  if shop[fruit_selected]
    cart << fruit_selected
    total += shop[fruit_selected]
  else
    puts 'Not in store'
  end
end

# 4. Print the bill (checkout)
puts "-------BILL---------"
puts "TOTAL: #{total}€"
puts "--------------------"
