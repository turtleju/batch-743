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

  def wrong_credentials
    puts "Wrong credentials... Try again"
  end

  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name} (#{meal.price}€)"
    end
  end

  def ask_for_index
    puts "Index?"
    return gets.chomp.to_i - 1
  end
end
