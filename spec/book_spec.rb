require './book/book'
require './label/label'
require './item'

describe Book do
  before :each do
    @label = Label.new('Water Fall', 'Blue')
    @book1 = Book.new('Victor', 'Good', '2015-09-05', false, 'comedy', 1)
    @book2 = Book.new('John', 'Bad', '2000-09-05', true, 'Drama', 2)
    @book1.add_label(@label)
  end

  
  it 'It should an instance Book object' do
    expect(@book1).to be_instance_of Book
  end

  it 'should return true when cover_state equals bad' do
    expect(@book2.can_be_archived?).to eql true
  end

  it 'should return false when cover_state is not equal to "bad" ' do
    expect(@book1.can_be_archived?).to eql false
  end

  it 'should return true if published_date is older than 10 years' do
    expect(@book2.can_be_archived?).to eql true
  end

  it 'should add label to item ' do
    expect(@book1.label.items.length).to eql 1
  end
  
end