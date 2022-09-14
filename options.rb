require './book/create_book'
require_relative './label/label_module'
require_relative './book/book_module'
require_relative './store/preserve_book'
require_relative './store/preserve_label'
require_relative './music/music_album'

class Options
  include LabelModule
  include BookModule
  include BooksPreserve
  include LabelsPreserve

  def initialize
    @books = load_books
    @labels = load_labels
    @execute = CreateBook.new(@books, @labels)
    @music_albums = []
  end

  def show_options
    puts ['1 - List all books',
          '2 - List all music albums',
          '3 - List of games',
          '4 - List all genre',
          '5 - List all labels',
          '6 - List all authors',
          '7 - Add a book',
          '8 - Add a music album',
          '9 - Add a game',
          '0 - quit!']
  end

  def chosen_value(value)
    case value
    when '1'
      list_all_books
    when '2'
      list_all_music_album
    when '3'
      list_games
    when '4'
      list_all_genre
    when '5'
      list_all_labels
    when '6'
      list_authors
    when '7'
      @execute.add_book
    when '8'
      add_music_album
    when '9'
      add_game
    else
      puts 'Please enter a number between 1 and 0.'
    end
  end

  def add_music_album
    print 'Enter the author of the music album: '
    title = gets.chomp
    print 'Enter the source of the music album: '
    source = gets.chomp
    print 'Enter the label of the music album: '
    label = gets.chomp
    print 'Enter the publish date of the music album: [yyyy/mm/dd] '
    publish_date = gets.chomp
    print 'Archived? [true/false] '
    archived = gets.chomp.downcase
    print 'On Spotify? [true/false] '
    on_spotify = gets.chomp.downcase

    if archived == 'true' && on_spotify == 'true'
      @music_albums << MusicAlbum.new(true, "title", "source", "label", "2022/09/16", true)
    elsif archived == 'false' || on_spotify == 'false'
      @music_albums << MusicAlbum.new(false, source, label, publish_date, archived: false)
    else
      puts 'Please enter true or false.'
    end
  end

  def list_all_music_album
    @music_albums.each do |music_album|
      puts "Title: #{music_album.title}, Source: #{music_album.source}, Label: #{music_album.label}, Publish date: #{music_album.publish_date}, Archived: #{music_album.archived}, On Spotify: #{music_album.on_spotify}"
    end
  end
end
