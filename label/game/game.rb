require 'date'
require_relative 'item'

class Game < Item
    attr_accessor :multiplayer, :last_played_at, :pulish_date

    def initialize (pulish_date, multiplayer, last_played_at)
        super(publish_date)
        @multiplayer = multiplayer
        @last_played_at = Date.strptime(last_played_at, '%Y-%m-%d')
    end
end