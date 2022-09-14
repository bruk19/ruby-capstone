require_relative '../item'

class MusicAlbum < Item
  attr_accessor :author, :source, :label, :on_spotify
  def initialize(on_spotify, author, source, label, publish_date, archived)
    super(publish_date, archived)
    @on_spotify = on_spotify
    @author = author
    @source = source
    @label = label
  end

  def can_be_archived?
    archived && @on_spotify
  end
end