require './game/game'
require './item'

describe Author do
  before :each do
    @Zabuza = Author.new('Deidara', 'Danzo')
  end

  context 'Test for Author class' do
    it 'should be instance of author' do
      expect(@Zabuza).to be_an_instance_of Author
    end

    it 'should return first-name' do
      expect(@Zabuza.first_name).to eq('Deidara')
    end

    it 'should return last-name' do
      expect(@Zabuza.last_name).to eq('Danzo')
    end
  end
end
