require_relative './game'
require_relative '../item'

class CreateBook
    def initialize(game = 'unknown')
      @game = game
    end

    def add_game
        print 'Publish date [YYYY-MM-DD] : '
        publish_date = gets.chomp
    
        print 'Is multiplayer game? [ yes, no ]: '
        multiplayer = gets.chomp
    
        case multiplayer
          when 'yes' 
            multiplayer_value = 'yes'
          when 'no'
            multiplayer_value = 'no'
          else
            puts 'yes or no'
            multiplayer_value = gets.chomp
        end
    
        print 'Last played at[YYYY-MM-DD]: '
        last_played_at = gets.chomp
    
        game = Game.new(publish_date, multiplayer_value, last_played_at)
        @games.push(game)
        message('New Game added successfully')
    end
end