require 'date'

class Item
  attr_accessor :label, :author
  attr_reader :id, :publish_date, :archived

  def initialize(publish_date, archived, id = nil)
    @publish_date = publish_date
    @archived = archived
    @id = id || Random.rand(1..1000)
  end

  def move_to_archive
    archived unless can_be_archived?
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  private

  def can_be_archived?
    current_date = Date.today
    date_interval = current_date.year - Date.parse(@publish_date).year
    date_interval > 10
  end

end
