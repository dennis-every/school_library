class App
  attr_reader :books, :people

  def initialize
    @books = []
    @people = []
  end

  def add_teacher(teacher)
    @people.push(teacher)
  end

  def add_student(student)
    @people.push(student)
  end
end
