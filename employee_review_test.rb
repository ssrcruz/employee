require 'minitest/autorun'
require 'minitest/pride'
require './employee'
require './department'

class EmployeeReviewTest <Minitest::Test

  def test_01_department_class_with_name_exists
    assert Department
    assert Department.new("")
  end

  def test_02_employee_class_with_name_salary_exists
    assert Employee
    assert Employee.new("", 50000)
  end

  def test_03_add_employee_to_department
    developers = Department.new("Computer Science")
    ruben = Employee.new("Ruben", 50000)
    assert developers.add_employee(ruben)
    assert developers.roster.include?(ruben)
  end

  def test_04_get_employee_name
    carolina = Employee.new("Carolina", 60000)
    assert carolina.name == "Carolina"
    eric = Employee.new("Eric", 60000)
    assert eric.name == "Eric"
  end

  def test_05_get_employee_salary
    carolina = Employee.new("Carolina", 60000)
    assert carolina.salary == 60000
  end

  def test_06_get_departments_name
    computerscience = Department.new("Computer Science")
    assert computerscience.name == "Computer Science"
  end

end
