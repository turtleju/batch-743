require_relative 'castle'
require_relative 'house'
require_relative 'skyscraper'

castle = Castle.new('Windsor', 30, 40, 'George')

puts castle.butler #=> <#Butler 0x0090909...
puts castle.butler.name
