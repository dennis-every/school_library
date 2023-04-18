require './app'
require './menu'
require './options'

class Main
  def initialize
    puts 'Welcome to School Library App!'
    @options = Options.new
    @app = App.new
  end

  def run
    Menu.new
    selected = gets.chomp.to_i
    puts ''
    puts "You selected option #{selected}"
    case selected
    when 1..7
      @app.send(@options.get_option(selected))
    else
      puts 'Please select a valid option:'
    end
    run
  end
end

main = Main.new
main.run
