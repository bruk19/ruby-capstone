require_relative '../genre/genre'
require_relative '../item'

describe Genre do
  before :each do
    @genre = Genre.new('Rock')
    @item = Item.new('2020-01-01', false)
  end
  context 'when item is added to genre' do
    it 'when @genre is created items array should be empty' do
      expect(@genre.items).to be_empty
    end

    it 'shold have an @item in the items array' do
      @genre.add_item(@item)
      expect(@genre.items.length).to eq(1)
    end

    it 'should should have a correct name attribue' do
      expect(@genre.name).to eq('Rock')
    end
  end
end
