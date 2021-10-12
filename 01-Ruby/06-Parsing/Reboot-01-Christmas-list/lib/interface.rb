puts "Welcome in christmas list !"

gifts = [
  {
    name: 'velo',
    mark: true
  }, {
    name: 'skate',
    mark: false
  }]
#gifts = []

action = ''

while action != "quit"
  puts "Which action [list|add|delete|mark|quit] ?"
  action = gets.chomp
  case action
  when 'add'
    puts "What to add ?"
    gift_wish = gets.chomp
    gifts << { name: gift_wish, mark: false }
  when 'list'
    gifts.each_with_index do |gift, index|
      cross = gift[:mark] ? "[X]" : "[ ]"
      puts "#{index + 1} - #{cross} - #{gift[:name]}"
    end
  when 'delete'
    gifts.each_with_index do |gift, index|
      cross = gift[:mark] ? "[X]" : "[ ]"
      puts "#{index + 1} - #{cross} - #{gift[:name]}"
    end
    puts "Which gift do you want to delete ?"
    index_to_delete = gets.chomp.to_i - 1
    gifts.delete_at(index_to_delete)
  when 'mark'
    # display all gifts
    gifts.each_with_index do |gift, index|
      cross = gift[:mark] ? "[X]" : "[ ]"
      puts "#{index + 1} - #{cross} - #{gift[:name]}"
    end

    # ask wich gift to mark
    puts "Which gift do you want to mark ?"
    index_to_mark = gets.chomp.to_i - 1
    # mark the gift
    gift_to_mark = gifts[index_to_mark]
    gift_to_mark[:mark] = true
  end
end

puts 'Goodbye'

gifts = ['velo', 'skate']

# mark ?






