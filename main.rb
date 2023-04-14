require './app'

class Main
  def initialize
    puts 'Welcome to School Library App!'
    @app = App.new
  end

  def menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def options
    {
      1 => 'list_books',
      2 => 'list_people',
      3 => 'create_person',
      4 => 'create_book',
      5 => 'create_rental',
      6 => 'list_rentals',
      7 => 'exit'
    }
  end

  def run
    puts ''
    menu
    selected = gets.chomp.to_i
    puts ''
    puts "You selected option #{selected}"
    case selected
    when 1..7
      @app.send(options[selected])
    else
      puts 'Please select a valid option:'
    end
    run
  end
end

main = Main.new
main.run
