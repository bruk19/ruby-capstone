require_relative './game'
require_relative '../item'
require_relative '../author/author'

class CreateGame
  def initialize(game = 'unknown', author = 'unknown')
    @games = game
    @authors = author
  end

  def add_game
    print 'Publish date [YYYY-MM-DD] : '
    publish_date = gets.chomp

    print 'Is multiplayer game? [ yes, no ]: '
    multiplayer = gets.chomp

    case multiplayer
    when 'yes'
      multiplayer = 'yes'
    when 'no'
      multiplayer = 'no'
    else
      puts 'yes or no'
      multiplayer = gets.chomp
    end

    print 'is Archived [Y/N]: '
    archived = gets.chomp.downcase

    case archived
    when 'y'
      archived = true

    when 'n'
      archived = false
    else
      puts('please enter [Y/N]: ')
    end

    print 'Last played at[YYYY-MM-DD]: '
    last_played_at = gets.chomp

    print 'Author First Name: '
    first_name = gets.chomp

    print 'Author Last Name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors.push(author)
    game = Game.new(publish_date, multiplayer, last_played_at, archived, first_name)
    @games.push(game)

    author.add_item(game)
    game.add_author(author)

    puts 'New Game added successfully'
  end
end
