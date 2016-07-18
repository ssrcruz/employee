require "./employee.rb"
class Department
  attr_reader :roster, :name # attr_reader creates a method and an instance variable
  def initialize(name)
    @name = name
    @roster = []
    @employees = []
  end

  def add_employee(employee)
    @roster << employee
  end

  def total_salary
    @roster.inject(0) {|total, employee| total += employee.salary }
    # .inject method will take an argument and a block.
    # The block will be executed once for each element contained in the roster.
    # It will inject 0 for each element and do 0 + employee.salary and then add that to the total
  end

  def department_raise(raise)
    satisfactorily_salary = raise
    satisfactorily_employee = []
    @employees.each do |n| # checks the employee list and checks if an employee is performing satisfactorily
      if n.satisfactorily == true # if true it will add their current salary plus the raise
        n.salary + satisfactorily_salary
        satisfactorily_employee << n # it will then add the employee into the satisfactorily list
      end
    end

  end



end
