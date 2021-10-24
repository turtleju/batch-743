class Task
  attr_accessor :id, :description

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done] || 0
  end

  def save
    if exists_in_db?
      update
    else
      create
    end
  end

  def self.all
    query = 'SELECT * FROM tasks'
    DB.execute(query).map { |hash| build_instance(hash) }
  end

  def self.last
    result = DB.execute("SELECT * FROM tasks ORDER BY id DESC LIMIT 1").first
    build_instance(result) if result
  end

  def self.first
    result = DB.execute("SELECT * FROM tasks LIMIT 1").last # last or first does not matter when only one element
    build_instance(result) if result
  end

  def self.find(id)
    query = <<-SQL
      SELECT *
      FROM tasks
      WHERE id = ?
    SQL
    result = DB.execute(query, id).first

    build_instance(result) if result
  end

  def destroy
    DB.execute('DELETE FROM tasks WHERE id = ?', @id)
    self
  end

  def new_record?
    @id.nil?
  end

  private

  def exists_in_db?
    !new_record?
  end

  def create
    query = <<-SQL
      INSERT INTO tasks
      (title, description, done)
      VALUES (?, ?, ?)
    SQL
    DB.execute(query, @title, @description, @done)
  end

  def update
    query = <<-SQL
      UPDATE tasks
      SET title = ?, description = ?, done = ?
      WHERE id = ?
    SQL
    DB.execute(query, @title, @description, @done, @id)
  end

  def self.build_instance(hash)
    new(
      id: hash["id"],
      title: hash["title"],
      description: hash["description"],
      done: hash["done"]
    )
  end
end
