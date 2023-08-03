require_relative '../person'

RSpec.describe Person do
  describe '#initialize' do
    it 'sets default values if no arguments are provided' do
      person = Person.new
      expect(person.id).to be_a(Integer)
      expect(person.name).to eq('Unknown')
      expect(person.age).to be_nil
      expect(person.parent_permission).to be_truthy
      expect(person.rentals).to eq([])
    end

    it 'correctly assigns provided values' do
      person = Person.new(1, 'John', 25, parent_permission: false)
      expect(person.id).to eq(1)
      expect(person.name).to eq('John')
      expect(person.age).to eq(25)
      expect(person.parent_permission).to be_falsey
      expect(person.rentals).to eq([])
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      person = Person.new(1, 'John')
      expect(person.correct_name).to eq('John')
    end
  end

  describe '#can_use_services?' do
    it 'returns true if person is of age' do
      person = Person.new(1, 'John', 20)
      expect(person.can_use_services?).to be_truthy
    end

    it 'returns true if person is underage but has parent permission' do
      person = Person.new(1, 'John', 16, parent_permission: true)
      expect(person.can_use_services?).to be_truthy
    end

    it 'returns false if person is underage and has no parent permission' do
      person = Person.new(1, 'John', 16, parent_permission: false)
      expect(person.can_use_services?).to be_falsey
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the person\'s rentals array' do
      person = Person.new(1, 'John', 20)
      book = Book.new('The Lord of the Rings', 'J.R.R. Tolkien')
      rental = Rental.new(book, person, '2023-08-03')
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end

    it 'sets the person as the rental\'s person' do
      person = Person.new(1, 'John', 20)
      book = Book.new('The Lord of the Rings', 'J.R.R. Tolkien')
      rental = Rental.new(book, person, '2023-08-03')
      person.add_rental(rental)
      expect(rental.person).to eq(person)
    end
  end
end
