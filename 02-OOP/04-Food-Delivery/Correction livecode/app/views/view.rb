class View
  def display(elements)
    elements.each do |element|
      puts "#{element.id} - #{element.name}"
    end
  end

  def ask_for(stuff)
    puts "#{stuff}?"
    return gets.chomp
  end
end
