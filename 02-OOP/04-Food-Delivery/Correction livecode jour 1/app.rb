# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'router'

meal_csv_path = File.join(__dir__, 'data/meals.csv')
customer_csv_path = File.join(__dir__, 'data/customers.csv')

meal_repository = MealRepository.new(meal_csv_path)
customer_repository = CustomerRepository.new(customer_csv_path)

meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)

router = Router.new(meals_controller, customers_controller)

router.run
