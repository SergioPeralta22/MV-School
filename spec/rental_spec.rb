require_relative '../Rental'
require_relative '../student'
require_relative '../book'

RSpec.describe Rental do
  describe '#initialize' do
    it 'correctly assigns provided values' do
      book = Book.new('Ruby', 'Sahar')
      person = Person.new
      rental = Rental.new(book, person, '03/08/2023')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq('03/08/2023')
      expect(rental.book.rentals.length).to eq(1)
      expect(rental.person.rentals.length).to eq(1)
    end
  end
end
