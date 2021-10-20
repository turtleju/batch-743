require_relative "../views/view"

class SessionsController
  def initialize(employee_repository)
    @employee_repo = employee_repository
    @view = View

  end

  def log_in
    username = @view.ask_for(:username)
    password = @view.ask_for(:password)
    employee = @employee_repo.find_by_username(username)

    if employee && password == employee.password
      return employee
    else
      @view.wrong_credentials
      log_in
    end
  end
end
