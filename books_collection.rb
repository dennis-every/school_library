require './book'

class BooksCollection
  attr_accessor :books

  def initialize
    book = Book.new('Catcher in the Rye', 'J.D. Salinger')
    @books = [book]
  end

  def list_books
    if @books == []
      puts 'Sorry, we have no books :-('
    else
      @books.each_with_index do |book, index|
        puts %(#{index + 1} - Title: "#{book.title}", Author: #{book.author})
      end
    end
  end

  def add_book(book)
    @books.push(book) unless @books.include?(book)
  end
end
