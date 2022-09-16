require_relative './game'
require_relative '../item'

module GameModule
  def list_games
    if @games.empty?
      puts 'No game in the catalog'
      return
    end
    puts "\n"

    @games.each do |game|
      print "Author: #{game.first_name},
             publish date: #{game.publish_date},
             multiplayer: #{game.multiplayer},
             last_played_at: #{game.last_played_at}"
      puts
    end
  end
end
