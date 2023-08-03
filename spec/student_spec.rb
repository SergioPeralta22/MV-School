require_relative '../student'
require_relative '../classroom'

RSpec.describe Student do
  describe '#initialize' do
    it 'sets default values if no arguments are provided' do
      student = Student.new
      expect(student.id).to be_a(Integer)
      expect(student.name).to eq('Unknown')
      expect(student.age).to be_nil
      expect(student.parent_permission).to be_truthy
      expect(student.rentals).to eq([])
    end

    it 'correctly assigns provided values' do
      student = Student.new(id: 1, name: 'John', age: 20, parent_permission: true)
      expect(student.id).to eq(1)
      expect(student.name).to eq('John')
      expect(student.age).to eq(20)
      expect(student.parent_permission).to be_truthy
      expect(student.rentals).to eq([])
    end
  end

  describe '#play_hooky' do
    it 'returns the correct message' do
      student = Student.new
      expect(student.play_hooky).to eq('¯\\_(ツ)_/¯')
    end
  end
end
