require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :title, :publish_date

  def initialize(on_spotify, title, publish_date, archived)
    super(publish_date, archived)
    @on_spotify = on_spotify
    @title = title
  end

  def can_be_archived?
    super && @on_spotify
  end
end
