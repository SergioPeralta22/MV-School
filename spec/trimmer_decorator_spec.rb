require_relative '../person'
require_relative '../trimmer_decorator'

describe Decorator do
  before :each do
    @person = Person.new(22, 'maximilianus')
    @trimmer_decorator = TrimmerDecorator.new(@person)
  end

  context 'correct_name' do
    it 'should output name with max length = 10 (Trimmer)' do
      expect(@trimmer_decorator.correct_name).to eq 'maximilian'
    end
  end
end
