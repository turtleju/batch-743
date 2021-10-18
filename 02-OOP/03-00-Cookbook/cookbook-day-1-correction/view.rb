class View
  def display_recipes(all_recipes)
    if all_recipes.count > 0
      all_recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. (#{recipe.rating} / 5) #{recipe.name} :#{recipe.description}"
      end
    else
      puts "please add a recipe"
    end
  end

  def ask(question)
    puts "#{question}?"
    gets.chomp
  end

end