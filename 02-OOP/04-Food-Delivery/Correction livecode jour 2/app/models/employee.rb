class Employee
  # id, a username and a password and role
  attr_accessor :id
  attr_reader :password

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def rider?
    employee.role == 'rider'
  end

  def manager?
    employee.role == 'manager'
  end
end
