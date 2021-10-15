require_relative "task"
require_relative "repository"
require_relative "view"
require_relative "controller"
require_relative "router"

view = View.new
repository = Repository.new
controller = Controller.new(repository, view)

router = Router.new(controller)
router.start