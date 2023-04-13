require './book'
require './rental'
require './student'
require './teacher'

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

  def add_rental(date, book, person)
    Rental.new(date, book, person)
  end

  def rentals(person_id)
    person = @people.find { |p| p.id == person_id }
    person.rentals
  end
end
