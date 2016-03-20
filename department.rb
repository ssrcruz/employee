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




end
