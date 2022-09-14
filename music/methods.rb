require_relative './music_album'
require_relative '../genre/genre'
require_relative '../genre/methods'

class RunMusic
  def self.add_music_album(music_albums, genre_list)
    print 'Enter the author of the music album: '
    title = gets.chomp
    print 'Enter the source of the music album: '
    source = gets.chomp
    print 'Enter the label of the music album: '
    label = gets.chomp
    print 'Enter the genre of the music album: '
    genre_name = gets.chomp
    print 'Enter the publish date of the music album: [yyyy/mm/dd] '
    publish_date = gets.chomp
    print 'Archived? [true/false] '
    archived = gets.chomp.downcase
    print 'On Spotify? [true/false] '
    on_spotify = gets.chomp.downcase

    genre = Genre.new(genre_name)
    if archived == 'true' && on_spotify == 'true'
      music_album = MusicAlbum.new(true, title, source, label, publish_date, true)
      music_album.genre=(genre)
      music_albums << music_album
      genre_list << genre.items[0].genre.name
      puts "\nMusic album added successfully!"
    elsif archived == 'false' || on_spotify == 'false'
      music_album = MusicAlbum.new(false, title, source, label, publish_date, false)
      music_album.genre=(genre)
      music_albums << music_album
      genre_list << genre.items[0].genre.name
      puts "\nMusic album added successfully!"
    else
      puts "\nInvalid Option! Please enter [true/false] in the fields as requested."
    end

    # save_data to database
    RunGenre.save_genre(genre_list)
    save_music_album(music_albums)
  end

  def self.list_all_music_album(music_albums)
    if music_albums.empty? 
      puts "\nThere are no music albums yet." 
    else puts "################## Music Albums ##################"
      music_albums.each_with_index do |music_album, index|
        puts "#{index}) Title: \"#{music_album.author}\", Source: \"#{music_album.source}\", Label: \"#{music_album.label}\", Genre: #{music_album.genre.name}, Publish date: \"#{music_album.publish_date}\", Archived: \"#{music_album.archived}\", On Spotify: \"#{music_album.on_spotify}\""
      end
    end
  end

  def self.save_music_album(music_albums)
    # write to file
    record = []
    File.write('./json/music_album.json', []) unless File.exist?('./json/music_album.json')
    music_albums.each { |music_album| 
      record << { 
      genre: music_album.genre.name,
      title: music_album.author,
      source: music_album.source,
      label: music_album.label,
      publish_date: music_album.publish_date,
      archived: music_album.archived,
      on_spotify: music_album.on_spotify
      }
    }
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
      if record['archived'] == true && record['on_spotify'] == true
        music_album = MusicAlbum.new(true, record['title'], record['source'], record['label'], record['publish_date'], true)
        music_album.genre=(genre)
        music_records << music_album
      elsif record['archived'] == false || record['on_spotify'] == false
        music_album = MusicAlbum.new(false, record['title'], record['source'], record['label'], record['publish_date'], false)
        music_album.genre=(genre)
        music_records << music_album
      end
    end
    music_records
  end
  
end