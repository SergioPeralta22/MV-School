require_relative '../decorator'
require_relative '../person'

describe Decorator do
  before :each do
    @person = Person.new(22, 'maximilianus')
    @decorator = Decorator.new(@person)
  end

  context 'correct_name' do
    it 'Check if nameable exists and equals initialization' do
      expect(@decorator.correct_name).to eq 'maximilianus'
    end
  end
end
