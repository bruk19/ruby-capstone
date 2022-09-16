require_relative '../music/music_album'
require_relative '../item'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new(false, 'The Dark Side of the Moon', '1973/03/01', true)
  end
  context 'when an object is created' do
    it 'should should be an instance of MusicAlbum class' do
      expect(@music_album).to be_instance_of(MusicAlbum)
    end

    it 'should should inherit from the item class' do
      expect(@music_album).to be_kind_of(Item)
    end

    it 'should have parameters set correctly' do
      expect(@music_album.on_spotify).to eq(false)
      expect(@music_album.title).to eq('The Dark Side of the Moon')
      expect(@music_album.publish_date).to eq('1973/03/01')
      expect(@music_album.archived).to eq(true)
    end

    it 'should have can_be_achived set to false' do
      expect(@music_album.can_be_archived?).to eq(false)
    end

    it 'should have can_be_achived set to true' do
      @music_album.on_spotify = true
      expect(@music_album.can_be_archived?).to eq(true)
    end
  end
end
