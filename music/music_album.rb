require_relative '../item'

class MusicAlbum < Item
  attr_accessor :author, :source, :label
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

# test = MusicAlbum.new(true, "2022/09/08", archived: true)
test = MusicAlbum.new(false, "title", "source", "label", "2022/09/16", true)
p test
p test.can_be_archived?