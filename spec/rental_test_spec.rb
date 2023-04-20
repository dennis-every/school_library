require 'rspec'
require './rental'

describe Rental do
  let(:book) { double('Book', id: 1, title: 'A book', author: 'An author', rentals: []) }
  let(:person) { double('Person', id: 1, name: 'A person', age: 30, rentals: []) }

  before do
    allow(Book).to receive(:find_by_id).with(book.id).and_return(book)
    allow(Person).to receive(:find_by_id).with(person.id).and_return(person)
  end

  describe '#initialize' do
    it 'creates a new rental with the given date, book_id and person_id' do
      rental = described_class.new('2022-01-01', book.id, person.id)

      expect(rental.date).to eq('2022-01-01')
      expect(rental.book_id).to eq(book.id)
      expect(rental.person_id).to eq(person.id)
    end

    it 'adds the rental to the book and person rentals' do
      rental = described_class.new('2022-01-01', book.id, person.id)

      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end

    it 'adds the rental to the list of all rentals' do
      rental = described_class.new('2022-01-01', book.id, person.id)

      expect(described_class.all).to include(rental)
    end
  end

  describe '.all' do
    it 'returns the list of all rentals' do
      rental1 = described_class.new('2022-01-01', book.id, person.id)
      rental2 = described_class.new('2022-02-02', book.id, person.id)

      expect(described_class.all).to include(rental1, rental2)
    end
  end
end
