require_relative "task"
require 'amazing_print'
require "sqlite3"

DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true

DB.execute("SELECT * FROM tasks")

# ap Task.all

# task.detroy
# task = Task.find(1) # Task avec id 1
# ap task
# ap Task.find(45) # nil
# task.destroy

ap Task.all

new_task = Task.new(title: "Finir ce livecode", description: 'vite, svp')
new_task.save

existing_task = Task.last
existing_task.description = "finir tres tres tres vite svp"
existing_task.save

ap Task.last
