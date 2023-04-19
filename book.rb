class Book
  @@all = []

  attr_reader :id
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @id = "#{title}_#{author}".length.to_i

    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_id(id)
    @@all.find { |book| book.id == id }
  end

  def self.create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    puts 'Book created successfully!'
    book
  end
end
