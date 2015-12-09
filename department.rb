class Department
  attr_reader :roster, :name # attr_reader creates a method and an instance variable
  def initialize(name)
    @name = name
    @roster = []
  end

  def add_employee(employee)
    @roster << employee
  end

  def total_salary
    add_employee
  end


end
