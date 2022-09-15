require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :title, :publish_date

  def initialize(on_spotify, title, publish_date, archived)
    super(publish_date, archived)
    @on_spotify = on_spotify
    @title = title
  end

  def can_be_archived?
    archived && @on_spotify
  end
end

p MusicAlbum.new(true, 'The Dark Side of the Moon', '1973/03/01', false).can_be_archived?
