require './book'
require './books_collection'
require './people_collection'
require './rental'
require './student'
require './teacher'

class App
  attr_reader :books, :people

  def initialize
    @books_collection = BooksCollection.new
    @books = @books_collection.books
    @people_collection = PeopleCollection.new
    @people = @people_collection.people
  end

  def add_rental(date, book, person)
    Rental.new(date, book, person)
  end

  def rentals(person_id)
    person = @people.find { |p| p.id == person_id }
    person.rentals
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

  def create_rental
    return puts "Sorry, we don't have any books for rent" if @books == []
    return puts "Sorry, we don't have registered people who can rent books" if @people == []

    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts %[#{index}) Title: "#{book.title}", Author: #{book.author}]
    end
    selected_book = @books[gets.chomp.to_i]
    puts %(You selected "#{selected_book.title}" written by #{selected_book.author})
    puts ''

    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |person, index|
      puts %[#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}]
    end
    selected_person = @people[gets.chomp.to_i]
    puts "You selected #{selected_person.name}"
    puts ''

    print 'Date: '
    entered_date = gets.chomp

    add_rental(entered_date, selected_book, selected_person)
    puts 'Rental created successfully!'
  end

  def list_rentals
    return puts "Sorry, we don't have any registered people" if @people == []

    print 'ID of person: '
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    return puts "Sorry, we don't have any person with this ID" unless person

    if person.rentals.any?
      puts 'Rentals:'
      person.rentals.each do |rental|
        puts %(Date: #{rental.date}, Book: "#{rental.book.title}" by #{rental.book.author})
      end
    else
      puts "Sorry, we don't have any rentals registered for #{person.name}"
    end
  end

  def exit
    puts 'Thanks for using this app - bye!'
    abort
  end
end
