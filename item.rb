require 'date'

class Item
  attr_accessor :author, :genre, :label, :source
  attr_reader :id, :publish_date, :archived

  def initialize(publish_date, archived: false, id = Random.rand(1..1000))
    @publish_date = publish_date
    @archived = archived
    @id = id
  end  

  def move_to_arcchived
    if(can_be_archived?) 
      archived = true
    end
  end

  private

  def can_be_archived?
    current_date = Date.today
    date_interval = current_date.year - @publish_date.year
    date_interval > 10 ? true : false
  end
end