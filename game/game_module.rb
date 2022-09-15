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
      puts "Author: #{game.author},
            publish date: #{game.publish_date},
            multiplayer: #{game.multiplayer},
            last_played_at: #{game.last_played_at}"
    end
  end
end
