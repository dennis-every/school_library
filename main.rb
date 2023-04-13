class EntryPoint
  def initialize
    puts 'Welcome to School Library App!'
    puts ''
    menu
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
    selected_option = gets.chomp
    puts "You selected option #{selected_option}"
  end
end

def main
  EntryPoint.new
end

main
