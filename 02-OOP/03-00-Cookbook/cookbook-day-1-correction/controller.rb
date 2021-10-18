require_relative 'view'
require_relative 'recipe'
require_relative 'scrapper_service'

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

  def search_on_the_web
    # 1. ask ingredient to the user
    ingredient = @view.ask("What ingredient are you looking for")
    # 2. scrapper avec l'ingredient
    recipes = ScrapperService.new(ingredient).call
    # 3. afficher les 5 premiers résultats du scrraping
    @view.display_recipes(recipes)
    # 4. on demande au user de choisir une recette
    index = @view.ask("Which recipe do you want to import").to_i - 1

    recipe = recipes[index]

    # 5. on import la recette
    @cookbook.add(recipe)
  end

  def destroy
    index
    array_index = @view.ask("Which recipe do you want to destroy").to_i - 1
    @cookbook.destroy(array_index)
  end

  def mark_as_done
    # 1. affiche les recettes
    index
    # 2. ask user for index to mark
    index = @view.ask("Which recipe do you want to mark as done").to_i - 1

    @cookbook.mark_as_done(index)
    # recipe = @cookbook.find(index)
    # @cookbook.update(index, recipe)
  end

end
