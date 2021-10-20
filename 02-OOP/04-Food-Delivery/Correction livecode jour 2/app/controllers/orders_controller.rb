require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/sessions_view"
require_relative "../views/orders_view"

class OrdersController
  def initialize(meal_repo, customer_repo, employee_repo, order_repo)
    @meal_repo = meal_repo
    @customer_repo = customer_repo
    @employee_repo = employee_repo
    @order_repo = order_repo
    @view = View.new
  end

  def add(current_user)
    # demander a la vue de lister les meals
    meals = @meal_repo.all
    @view.display_meals(meals)
    # demander a l'utilisateur l'index du meal
    meal_index = @view.ask_for_index
    meal_instance = meals[meal_index]

    # utilise l'index pour recupérer l'instance aupres du meal repo

    # current usr : parametre de la methode

     # demander a la vue de lister les riders
    riders = @employee_repo.all_riders
    @view.display_riders(riders)
    rider_index = @view.ask_for_index
    rider_instance = riders[rider_index]

    # demander a l'utilisateur l'index du rider
    # utilise l'index pour recupérer l'instance aupres du rider repo

    order = Order.new(
      meal: meal_instance,
      customer: current_user,
      employee: rider_instance
    )
    # creer une instance d'order
    # ajouter l'order au repo
    @order_repo.create(order)
  end

end
