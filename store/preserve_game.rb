require 'json'

module GamesPreserve
  def store_games
    gamestore = []
    @games.each do |game|
      gamestore << { 
                  publish_date: game.publish_date,
                  multiplayer: game.multiplayer,
                  last_played_at: game.last_played_at,
                 }
    end
    File.write('./json/game.json', gamestore.to_json)
  end

  def load_games
    gamestore = []
    game_file = File.open('./json/game.json')
    if File.exist?(game_file) && File.read(game_file) != ''
      data = JSON.parse(game_file.read)
      data.each do |game|
        gamestore << game.new(game['pubish_date'], game['multiplayer'], game['last_played_at'])
      end
    else
      File.write(game_file, '[]')
    end
    gamestore
  end
end