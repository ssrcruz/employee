require "./department.rb"
class Employee
  attr_reader :name, :salary, :review_text, :satisfactorily
  def initialize(name, salary)
    @name = name
    @salary = salary
    @review_text = []
  end
  def add_review(review_text)
    @review_text << review_text
  end
  def satisfactorily
    @satisfactorily = true
  end

  def unsatisfactorily
    @satisfactorily = false
  end

  def satisfactorily?
    return @satisfactorily
  end


end
