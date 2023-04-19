require './rental'

class RentalsCollection
  attr_accessor :rentals

  def initialize
    @rentals = []
    return unless File.exist?('./data/rentals.json')

    rentals = FileHandler.read_file('./data/rentals.json')
    rentals.map do |hash|
      rental = Rental.new(hash['date'], hash['book_id'], hash['person_id'])
      @rentals.push(rental)
    end
  end

  def list_rentals(people)
    @people = people
    return puts "Sorry, we don't have any registered people" if @people == []

    print 'ID of person: '
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    return puts "Sorry, we don't have any person with this ID" unless person

    if person.rentals.any?
      puts 'Rentals:'
      person.rentals.each do |rental|
        book = Book.find_by_id(rental.book_id)
        puts %(Date: #{rental.date}, Book: "#{book.title}" by #{book.author})
      end
    else
      puts "Sorry, we don't have any rentals registered for #{person.name}"
    end
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end
end
