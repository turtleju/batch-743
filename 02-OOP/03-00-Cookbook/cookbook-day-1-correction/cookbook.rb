require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    @csv_options = { col_sep: ",", headers: :first_row, header_converters: :symbol}
    load_csv

    # TODO
  end

  def all
    @recipes
  end

  # def update(index, new_recipe)
  #   old_recipe = @recipes[index]
  #   destroy(old_recipe)
  #   add(new_recipe)
  # end

  def add(recipe)
    p recipe
    puts "-------------------"
    @recipes << recipe
    save_csv
  end

  def find(index)
    @recipes[index]
  end


  def destroy(index)
    @recipes.delete_at(index)
    save_csv
  end

  def mark_as_done(index)
    recipe = @recipes[index]
    recipe.mark_as_done!
    save_csv
  end

  private
  
  def load_csv
    
    CSV.foreach(@csv_file_path, @csv_options) do |row|
      row[:done] = row[:done] == "true"
      @recipes << Recipe.new(row)
    end 
  end
  
  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ["name", "description", "rating", "done", "prep_time"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.done, recipe.prep_time]
      end
    end

  end

end