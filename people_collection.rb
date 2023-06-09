require './person'

class PeopleCollection
  attr_accessor :people

  def initialize
    @people = []
    return unless File.exist?('./data/people.json')

    people = FileHandler.read_file('./data/people.json')
    people.map do |hash|
      person = case hash['type']
               when 'Student'
                 Student.new(hash['age'], hash['classroom'], hash['name'])
               when 'Teacher'
                 Teacher.new(hash['age'], hash['specialization'], hash['name'])
               else
                 Person.new(hash['age'], hash['name'])
               end
      @people.push(person)
    end
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
