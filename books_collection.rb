require './book'

class BooksCollection
  attr_accessor :books

  def initialize
    @books = []
    return unless File.exist?('./data/books.json')

    books = FileHandler.read_file('./data/books.json')
    books.map do |book_hash|
      book = Book.new(book_hash['title'], book_hash['author'])
      @books.push(book)
    end
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
