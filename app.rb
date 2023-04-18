require './book'
require './books_collection'
require './people_collection'
require './rentals_collection'
require './rental'
require './student'
require './teacher'
require './file_handler'
require 'json'

class App
  attr_reader :books, :people

  include FileHandler

  def initialize
    @books_collection = BooksCollection.new
    @books = @books_collection.books
    @people_collection = PeopleCollection.new
    @people = @people_collection.people
    @rentals_collection = RentalsCollection.new
    @rentals = @rentals_collection.rentals
  end

  def list_books
    @books_collection.list_books
  end

  def create_book
    book = Book.create_book
    @books_collection.add_book(book)
  end

  def list_people
    @people_collection.list_people
  end

  def create_person
    person = Person.create_person
    @people_collection.add_person(person)
    puts 'Person created successfully!'
  end

  def list_rentals
    @rentals_collection.list_rentals(@people)
  end

  def rentals(person_id)
    person = @people.find { |p| p.id == person_id }
    person.rentals
  end

  def create_rental
    rental = Rental.create_rental(@books, @people)
    @rentals_collection.add_rental(rental)
  end

  def save_books
    FileHandler.save(books, 'books.json')
  end

  def exit
    FileHandler.save(@books, 'books.json') if @books.any?
    FileHandler.save(@people, 'people.json') if @people.any?
    FileHandler.save(@rentals, 'rentals.json') if @rentals.any?
    puts 'Thanks for using this app - bye!'
    abort
  end
end
