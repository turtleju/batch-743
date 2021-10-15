class Repository
  def initialize
    @tasks = []
  end
  
  def list
    @tasks
  end

  def add(task)
    @tasks << task
  end

  def find(index)
    @tasks[index]
  end

  # def update
  # end

  def destroy(task)
    @tasks.delete(task)
  end
end