class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, id = Random.rand(1..1000))
    @title = title
    @color = color
    @id = id
    @items = []
  end

  def add_item(item)
    item.label = self
    @items << item
  end
end
