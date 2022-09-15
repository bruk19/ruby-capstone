require './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :pulish_date, :archived, :author

  def initialize(publish_date, multiplayer, last_played_at, archived, name)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = Date.strptime(last_played_at, '%Y-%m-%d')
    @author = name
  end

  def can_be_archived?
    super && (Date.today.year - @last_played_at.year) > 2
  end
end
