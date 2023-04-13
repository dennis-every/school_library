class App
  attr_reader :books, :people

  def initialize
    @books = []
    @people = []
  end

  def add_teacher(teacher)
    @people.push(teacher) unless @people.include?(teacher)
  end

  def add_student(student)
    @people.push(student) unless @people.include?(student)
  end

  def add_book(book)
    @books.push(book) unless @books.include?(book)
  end
end
