class Router
  def initialize(controller)
    # RTODDO
    @controller = controller
    @run = true
  end

  def start
    puts "Welcome to the TODO"
    while @run
      action_list
      puts "What to do now ?"
      puts "--------------------"
      choice = gets.chomp.to_i
      route_action(choice)
    end
  end

  def action_list
    puts "1- List all tasks"
    puts "2- Create a task"
    puts "3- Mark a task as done"
    puts "4- Delete a task"
    puts "5- exit"
  end

  def route_action(choice)
    case choice
    when 1 then @controller.list_tasks
    when 2 then @controller.create_a_task
    when 3 then @controller.mark_a_task_as_done
    when 4 then @controller.delete_task
    when 5 then @run = false
    else 
      puts "error not the right command dummy"
      action_list
    end
  end
end