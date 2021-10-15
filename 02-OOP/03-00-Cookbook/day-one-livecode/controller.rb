require_relative "task"

class Controller
  def initialize(repository, view)
    # TODO
    @repository = repository
    @view = view
  end

  def list_tasks
    # get all the tasks from the repo
    tasks = @repository.list
    # afficher all the tasks
    @view.display_tasks(tasks)
  end
  
  def create_a_task
    # 1. Ask the user a name for the task
    name = @view.ask_for_name
    # 2. Create the task
    task = Task.new(name)
    # 3. Add the task to repository to store it
    @repository.add(task)
  end

  def mark_a_task_as_done
    index = @view.ask_for_index
    # récupérer la tache
    task = @repository.find(index)
    # mark task as done
    task.mark_as_done!
  end


  def delete_task
  end
end