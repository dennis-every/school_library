class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def self.select_book(books)
    @books = books
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts %[#{index}) Title: "#{book.title}", Author: #{book.author}]
    end
    selected_book = @books[gets.chomp.to_i]
    puts %(You selected "#{selected_book.title}" written by #{selected_book.author})
    puts ''
    selected_book
  end

  def self.select_person(people)
    @people = people
    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |person, index|
      puts %[#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}]
    end
    selected_person = @people[gets.chomp.to_i]
    puts "You selected #{selected_person.name}"
    puts ''
    selected_person
  end

  def self.create_rental(books, people)
    @books = books
    @people = people
    return puts "Sorry, we don't have any books for rent" if @books == []
    return puts "Sorry, we don't have registered people who can rent books" if @people == []

    selected_book = select_book(@books)

    selected_person = select_person(@people)

    print 'Date: '
    entered_date = gets.chomp
    rental = Rental.new(entered_date, selected_book, selected_person)
    puts 'Rental created successfully!'
    rental
  end
end
