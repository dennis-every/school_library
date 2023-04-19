require './book'
require './person'

class Rental
  @@all = []

  attr_accessor :date, :book_id, :person_id

  def initialize(date, book_id, person_id)
    @date = date
    @book_id = book_id.to_i
    @person_id = person_id.to_i

    @book = Book.find_by_id(@book_id)

    @book.rentals << self

    @person = Person.find_by_id(@person_id)
    @person.rentals << self

    @@all << self
  end

  def self.all
    @@all
  end

  def self.select_book
    @books = Book.all
    return puts "Sorry, we don't have any books for rent" if @books == []

    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts %[#{index}) Title: "#{book.title}", Author: #{book.author}]
    end
    selected_book = @books[gets.chomp.to_i]
    puts %(You selected "#{selected_book.title}" written by #{selected_book.author})
    puts ''
    selected_book
  end

  def self.select_person
    @people = Person.all
    return puts "Sorry, we don't have registered people who can rent books" if @people == []

    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |person, index|
      puts %[#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}]
    end
    selected_person = @people[gets.chomp.to_i]
    puts "You selected #{selected_person.name}"
    puts ''
    selected_person
  end

  def self.enter_date
    print 'Date: '
    gets.chomp
  end

  def self.create_rental
    selected_book = select_book
    selected_person = select_person
    entered_date = enter_date

    rental = Rental.new(entered_date, selected_book.id, selected_person.id)
    puts 'Rental created successfully!'
    rental
  end
end
