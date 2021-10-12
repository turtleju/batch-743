gifts = {
  velo: false
}

p gifts[:velo]
p gifts[:velo].class


gets_chomp = 'skate'
gifts[gets_chomp.to_sym] = true

p gifts
