require './book'
require './person'

class App
  attr_reader :books, :people

  def initialize
    @books = []
    @people = []
  end
end
