require_relative '../music/music_album'
require_relative '../item'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new(false, 'The Beatles', 'Abbey Road', 'Apple Records', '1969-09-26', true)
  end
  context 'when an object is created' do
    it 'should should be an instance of MusicAlbum class' do
      expect(@music_album).to be_instance_of(MusicAlbum)
    end

    it 'should should inherit from the item class' do
      expect(@music_album).to be_kind_of(Item)
    end

    it 'should have parameters set correctly' do
      expect(@music_album.author).to eq('The Beatles')
      expect(@music_album.source).to eq('Abbey Road')
      expect(@music_album.label).to eq('Apple Records')
      expect(@music_album.publish_date).to eq('1969-09-26')
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