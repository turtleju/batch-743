# 1. Print Welcome
puts "Welcome !"
# 2. Define your store (what items are for sale?)
shop = {
  kiwi: {
    price: 1.25,
    stock: 5
  },
  banana: {
    price: 0.5,
    stock: 4
  },
  mango: {
    price: 4,
    stock: 5
  }
}

shop.each do |fruit, data|
  puts "#{fruit}: #{data[:price]}€ (#{data[:stock]} available)"
end
# 3. Get items from the user (shopping)

fruit_selected = ''
cart = {}
while fruit_selected != 'quit'
  # ask user for item
  puts "Which item? (or 'quit' to checkout)"
  fruit_selected = gets.chomp
  if shop[fruit_selected.to_sym]
    puts "Which quantity ?"
    quantity = gets.chomp.to_i


    stock_fruit_left = shop[fruit_selected.to_sym][:stock]
    if cart.key?(fruit_selected.to_sym)
      stock_fruit_left -= cart[fruit_selected.to_sym]
    end

    if stock_fruit_left >= quantity
      # business as usual
      if cart.key?(fruit_selected.to_sym)
        cart[fruit_selected.to_sym] += quantity
      else
        cart[fruit_selected.to_sym] = quantity
      end

    # si pas assez de stock
    else
      # apologize message
      puts "Sorry, only #{stock_fruit_left} #{fruit_selected} left..."
      # pas d'ajout au panier
    end

  elsif fruit_selected != 'quit'
    puts 'Not in store'
  end
end

# calculate total
total = 0
cart.each do |fruit, quantity|
  price_one_fruit = shop[fruit][:price]
  total += quantity * price_one_fruit
end

# 4. Print the bill (checkout)
puts "-------BILL---------"
cart.each do |fruit, quantity|
  puts "#{fruit}: #{quantity} X #{shop[fruit][:price]}€ = #{quantity * shop[fruit][:price]}€"
end

puts "TOTAL: #{total}€"
puts "--------------------"
