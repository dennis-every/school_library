class Options
  def initialize
    @options = {
      1 => 'list_books',
      2 => 'list_people',
      3 => 'create_person',
      4 => 'create_book',
      5 => 'create_rental',
      6 => 'list_rentals',
      7 => 'exit'
    }
  end

  def get_option(key)
    @options[key]
  end
end
