require_relative '../book'

describe Book do
  before(:each) do
    @book = Book.new('Ruby', 'Sahar')
  end

  it 'should have a title' do
    expect(@book.title).to eq('Ruby')
  end

  it 'should have an author' do
    expect(@book.author).to eq('Sahar')
  end

  it 'should have rentals' do
    expect(@book.rentals).to eq([])
  end

  context 'It should create book and add rentals' do
    book = Book.new('Ruby is awfull', 'S. P.')
    it 'should create a new book' do
      expect(book.title).to eq('Ruby is awfull')
      expect(book.author).to eq('S. P.')
    end
  end
end
