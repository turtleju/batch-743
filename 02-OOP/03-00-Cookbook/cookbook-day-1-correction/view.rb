class View
  def display_recipes(all_recipes)
    all_recipes.each_with_index do |recipe, index|
     puts "#{index + 1} - #{recipe.name} : #{recipe.description}"
    end
  end

  def ask(question)
    puts "#{question}?"
    gets.chomp
  end

end