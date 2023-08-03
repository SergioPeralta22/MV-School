require_relative '../teacher'

RSpec.describe Teacher do
  describe '#initialize' do
    it 'sets default values if only mandatory arguments are provided' do
      teacher = Teacher.new('English', 'Robert')
      expect(teacher.id).to be_a(Integer)
      expect(teacher.specialization).to eq('English')
      expect(teacher.name).to eq('Robert')
      expect(teacher.age).to be_nil
      expect(teacher.parent_permission).to be_truthy
      expect(teacher.rentals).to eq([])
    end

    it 'correctly assigns provided values' do
      teacher = Teacher.new('Math', 'Albert', 2, 60)
      expect(teacher.specialization).to eq('Math')
      expect(teacher.id).to eq(2)
      expect(teacher.name).to eq('Albert')
      expect(teacher.age).to eq(60)
      expect(teacher.parent_permission).to be_truthy
      expect(teacher.rentals).to eq([])
    end
  end

  describe '#can_use_services?' do
    it 'Should be true' do
      teacher = Teacher.new('Sports', 'Frank')
      expect(teacher.can_use_services?).to be_truthy
    end
  end
end
