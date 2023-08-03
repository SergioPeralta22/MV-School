require_relative '../person'
require_relative '../capitalize_decorator'

describe Decorator do
  before :each do
    @person = Person.new(22, 'maximilianus')
    @capitalized_person = CapitalizeDecorator.new(@person)
  end

  context 'correct_name' do
    it 'should capitalize the name' do
      print @capitalized_person.correct_name
      expect(@capitalized_person.correct_name).to eq 'Maximilianus'
    end
  end
end
