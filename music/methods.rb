require_relative './music_album'
class RunMusic
  def self.add_music_album(music_albums)
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
      music_albums << MusicAlbum.new(true, title, source, label, publish_date, true)
      puts "\nMusic album added successfully!"
    elsif archived == 'false' || on_spotify == 'false'
      music_albums << MusicAlbum.new(false, title, source, label, publish_date, false)
      puts "\nMusic album added successfully!"
    else
      puts "\nInvalid Option! Please enter [true/false] in the fields as requested."
    end
  end

  def self.list_all_music_album(music_albums)
    puts "\nThere are no music albums yet." if music_albums.empty?
    music_albums.each_with_index do |music_album, index|
      puts "################## Music Albums ##################"
      puts "#{index}) Title: \"#{music_album.author}\", Source: \"#{music_album.source}\", Label: \"#{music_album.label}\", Publish date: \"#{music_album.publish_date}\", Archived: \"#{music_album.archived}\", On Spotify: \"#{music_album.on_spotify}\""
    end
  end
end