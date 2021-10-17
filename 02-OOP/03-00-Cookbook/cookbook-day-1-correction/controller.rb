require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new

  end

  def index
    # Get all recipes
    all_recipes = @cookbook.all
    
    # Display recipes
    @view.display_recipes(all_recipes)

  end

  def create
    # Ask name and description to user
    name = @view.ask("Recipe name")
    description = @view.ask("Recipe description")

    recipe = Recipe.new(name: name, description: description)

    # Add recipe to cookbook and save
    @cookbook.add(recipe)
  end

  def destroy
    index
    array_index = @view.ask("Which recipe do you want to destroy").to_i - 1
    @cookbook.destroy(array_index)
  end
end
