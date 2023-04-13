require './book'
require './person'

class App
  attr_reader :books
  
  def initialize
    @books = []
    @people = []
  end
end
