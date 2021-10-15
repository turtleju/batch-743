class View

  def display_tasks(tasks)
    tasks.each_with_index do |task, index|
      status = task.done? ? "[X]" : "[ ]"
       puts "#{index + 1}. #{status} #{task.name}"
    end

  end

  def ask_for_name
    puts "give me the name of the task please ?"
    print ">"
    return gets.chomp
  end

  def ask_for_index
    puts "Which task would like to mark as done ?"
    print ">"
    return gets.chomp.to_i - 1
  end
end