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
    computer_science = Department.new("Computer Science")
    ruben = Employee.new("Ruben", 50000)
    assert computer_science.add_employee(ruben)
    assert computer_science.roster.include?(ruben)
  end

  def test_04_get_employee_name
    john = Employee.new("John", 60000)
    assert john.name == "John"
    eric = Employee.new("Eric", 60000)
    assert eric.name == "Eric"
  end

  def test_05_get_employee_salary
    john = Employee.new("John", 60000)
    assert john.salary == 60000
  end

  def test_06_get_departments_name
    computerscience = Department.new("Computer Science")
    assert computerscience.name == "Computer Science"
  end

  def test_07_get_total_salary_of_all_employees
    computerscience = Department.new("Computer Science")
    john = Employee.new("John", 60000)
    eric = Employee.new("Eric", 60000)
    assert computerscience.add_employee(john)
    assert computerscience.add_employee(eric)

    assert_equal 120000, computerscience.total_salary
  end

  def test_08_add_employee_review_text
    john = Employee.new("John", 60000)
    review_text = "This employee has been performing poorly"
    john.add_review(review_text)
    assert_equal review_text, john.review_text[0]

    ruben = Employee.new("Ruben", 60000)
    review_text = "This employee has been performing great and has exceeded expectations"
    ruben.add_review(review_text)
    assert_equal review_text, ruben.review_text[0]
  end

  def test_09_employee_performing_satisfactorily_or_unsatisfactorily
    john = Employee.new("John", 60000)
    ruben = Employee.new("Ruben", 50000)
    ruben.satisfactorily
    john.unsatisfactorily
    assert_equal true, ruben.satisfactorily?
    assert_equal false, john.satisfactorily?
  end

  def test_10_give_raise
    john = Employee.new("John", 60000)
    john.give_raise(10000)

    assert_equal 70000, john.salary
  end

  def test_11_give_raise_to_department
    john = Employee.new("John", 60000)
    ruben = Employee.new("Ruben", 70000)
    computerscience = Department.new("Computer Science")
    computerscience.add_employee(john)
    computerscience.add_employee(ruben)
    ruben.satisfactorily == true
    john.satisfactorily == false
    computerscience.department_raise(10000)

    assert_equal 60000, john.salary
    assert_equal 70000, ruben.salary
  end

end
