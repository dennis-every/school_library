require './person'

class PeopleCollection
  attr_accessor :people

  def initialize
    @people = []
  end

  def list_people
    if @people == []
      puts 'Nope, no one here :-('
    else
      @people.each_with_index do |person, index|
        puts %(#{index + 1} - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age})
      end
    end
  end

  def add_person(person)
    @people.push(person) unless @people.include?(person)
  end

end