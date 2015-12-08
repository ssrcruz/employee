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

  def test_07_get_total_salary_of_all_employees
    computerscience = Department.new("Computer Science")
    carolina = Employee.new("Carolina", 60000)
    eric = Employee.new("Eric", 60000)
    assert computerscience.add_employee(carolina)
    assert computerscience.add_employee(eric)

    assert_equal 120000, computerscience.total_salary
  end

  def test_08_add_employee_review_text
    carolina = Employee.new("Carolina", 60000)
    text = "Employee Review Text Goes Here"
    carolina.add_review(text)
    assert_equal text, carolina.text[0]
  end

  def test_09_employee_performing_satisfactorily_or_unsatisfactorily
    carolina = Employee.new("Carolina", 60000)
    ruben = Employee.new("Ruben", 70000)
    ruben.satisfactorily
    carolina.unsatisfactorily
    assert_equal true, ruben.satisfactorily?
    assert_equal false, carolina.satisfactorily?
  end

  def test_10_give_raise
    carolina = Employee.new("Carolina", 60000)
    carolina.give_raise(10000)

    assert_equal 70000, carolina.salary
  end

  def test_11_give_raise_to_department
    carolina = Employee.new("Carolina", 60000)
    ruben = Employee.new("Ruben", 70000)
    developers = Department.new("Software Developers")
    developers.add_employee(carolina)
    developers.add_employee(ruben)
    ruben.satisfactorily = true
    carolina.unsatisfactorily = false
    developers.department_raise(10000)

    assert_equal 60000, carolina.salary
    assert_equal 80000, ruben.salary
  end

end
