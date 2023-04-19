require './nameable'
require './rental'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @name = name
    @parent_permission = parent_permission
    @age = age
    @rentals = []
    @id = Random.rand(1..1000)
    @type = self.class
  end

  def self.create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    selected = gets.chomp.to_i
    case selected
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Please select a valid option:'
      create_person
    end
  end

  def self.create_student
    age = gets_age
    name = gets_name
    classroom = gets_classroom
    parent_permission = gets_parent_permission
    Student.new(age, classroom, name, parent_permission: parent_permission)
  end

  def self.create_teacher
    age = gets_age
    name = gets_name
    specialization = gets_specialization
    Teacher.new(age, specialization, name)
  end

  def self.gets_age
    print 'Age: '
    gets.chomp
  end

  def self.gets_classroom
    print 'Classroom: '
    gets.chomp
  end

  def self.gets_name
    print 'Name: '
    gets.chomp
  end

  def self.gets_parent_permission
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Y'
      true
    when 'N'
      false
    else
      puts 'Please select a valid option'
      gets_parent_permission
    end
  end

  def self.gets_specialization
    print 'Specialization: '
    gets.chomp
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
