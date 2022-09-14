require 'date'

class Item
  attr_accessor :label
  attr_reader :id, :publish_date, :archived

  def initialize(publish_date, archived, id = nil)
    @publish_date = publish_date
    @archived = archived
    @id = id || Random.rand(1..1000)
  end

  def move_to_archive
    if (can_be_archived?)
      archived
    end
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  private

  def can_be_archived?
    current_date = Date.today
    date_interval = current_date.year - Date.parse(@publish_date).year
    date_interval > 10 ? true : false
  end
end
