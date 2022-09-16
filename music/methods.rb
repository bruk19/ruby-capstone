require_relative './music_album'
require_relative '../genre/genre'
require_relative '../genre/methods'

class RunMusic
  def self.add_music_album(music_albums, genre_list)
    print 'Enter the Title of the music album: '
    title = gets.chomp
    print 'Enter the genre of the music album: '
    genre_name = gets.chomp
    print 'Enter the publish date of the music album: [yyyy/mm/dd] '
    publish_date = gets.chomp
    print 'Archived? [true/false] '
    archived = gets.chomp.downcase
    print 'On Spotify? [true/false] '
    on_spotify = gets.chomp.downcase

    case on_spotify
    when 'true'
      on_spotify = true
    when 'false'
      on_spotify = false
    else
      puts 'Invalid option. Please try again.'
    end

    case archived
    when 'true'
      archived = true
    when 'false'
      archived = false
    else
      puts 'Invalid option. Please try again.'
    end

    genre = Genre.new(genre_name)
    music_album = MusicAlbum.new(on_spotify, title, publish_date, archived)
    music_album.genre = (genre)
    music_albums << music_album
    genre_list << genre.items[0].genre.name
    puts "\nMusic album added successfully!"

    # save_data to database
    RunGenre.save_genre(genre_list)
    save_music_album(music_albums)
  end

  def self.list_all_music_album(music_albums)
    if music_albums.empty?
      puts "\nThere are no music albums yet."
    else
      puts '################## Music Albums ##################'
      music_albums.each_with_index do |music_album, index|
        puts "#{index})"
        puts "Title: #{music_album.title}"
        puts "Genre: #{music_album.genre.name}"
        puts "Publish Date: #{music_album.publish_date}"
        puts "Archived: #{music_album.archived}"
        puts "On Spotify: #{music_album.on_spotify}\n"
        puts
      end
    end
  end

  def self.save_music_album(music_albums)
    # write to file
    record = []
    File.write('./json/music_album.json', []) unless File.exist?('./json/music_album.json')
    music_albums.each do |music_album|
      record << {
        genre: music_album.genre.name,
        title: music_album.title,
        publish_date: music_album.publish_date,
        archived: music_album.archived,
        on_spotify: music_album.on_spotify
      }
    end
    data = JSON.generate(record)
    File.write('json/music_album.json', data)
  end

  def self.load_music_albums
    # read from file
    music_records = []
    File.write('./json/music_album.json', []) unless File.exist?('./json/music_album.json')
    records = JSON.parse(File.read('./json/music_album.json'))

    records.each do |record|
      genre = Genre.new(record['genre'])
      music_album = MusicAlbum.new(record['on_spotify'], record['title'], record['publish_date'], record['archived'])
      music_album.genre = (genre)
      music_records << music_album
    end
    music_records
  end
end
