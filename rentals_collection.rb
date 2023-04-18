require './rental'

class RentalsCollection
  attr_accessor :rentals

  def initialize
    @rentals = []
    if File.exist?('./data/rentals.json')
      rentals = FileHandler.read_file('./data/rentals.json')
      rentals.map do |hash|
        rental = Rental.new(hash['date'], hash['book'], hash['person'])
        @rentals.push(rental)
      end
    end
    @books
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
        puts %(Date: #{rental.date}, Book: "#{rental.book.title}" by #{rental.book.author})
      end
    else
      puts "Sorry, we don't have any rentals registered for #{person.name}"
    end
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end
end
