require_relative './game'
require_relative '../item'

module GameModule
    def list_games
        if is_empty(@games)
          message('No game in the catalog')
          return
        end
        puts "\n"
    
        @games.each do |game|
          puts "publish date: #{game.publish_date}, multiplayer: #{game.multiplayer}, last_played_at: #{game.last_played_at}" 
        end
    end
end