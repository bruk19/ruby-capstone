require './item'

class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date, :title
  attr_reader :id

  def initialize(publisher, cover_state, publish_date, archived, label, id = Random.rand(1..1000))
    super(publish_date, archived, id)
    @publisher = publisher
    @cover_state = cover_state
    @id = id
    @title = label
  end
  
  def can_be_archived?
    super || @cover_state =='bad'
  end
end