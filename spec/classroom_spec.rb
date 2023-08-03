require_relative '../teacher'
require_relative '../classroom'

RSpec.describe Classroom do
  describe '#initialize' do
    it 'correctly assigns provided values' do
      classroom = Classroom.new('Geology')
      expect(classroom.label).to eq('Geology')
      expect(classroom.students).to eq([])
    end
  end

  describe '#add_student' do
    it 'Should add a student to @students' do
      classroom = Classroom.new('Geometry')
      student = Student.new
      classroom.add_student(student)
      expect(classroom.students.length).to eq(1)
    end
  end
end
