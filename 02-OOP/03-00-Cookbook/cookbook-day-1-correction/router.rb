class Router
  def initialize(controller)
    @controller = controller
    @run = true
  end

  def start
    puts "welcome to the cookboo"
    while @run
      print_actions
      choice = gets.chomp.to_i
      route_action(choice)
    end
  end

  def print_actions
    puts "1. lister les recettes"
    puts "2. ajouter les recettes"
    puts "3. supprimer les recettes"
    puts "4. exit"
  end

  def route_action(choice)
    case choice
    when 1 then @controller.index
    when 2 then @controller.create
    when 3 then @controller.destroy
    when 4 then @run = false
    end
  end
end