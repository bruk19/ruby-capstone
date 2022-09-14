require 'json'

class RunGenre
  def self.list_all_genres(genre_list)
    if genre_list.empty?
      puts "\nThere are no genres yet."
    else
      puts "################## Genres ##################"
      genre_list.each_with_index do |genre, index|
        puts "#{index}) #{genre}"
      end
    end
  end

  def self.save_genre(genre_list)
    # write to file
    record = []
    File.write('./json/genre.json', []) unless File.exist?('./json/genre.json')
    genre_list.each { |genre| record << { name: genre } }
    data = JSON.generate(record)
    File.write('json/genre.json', data)
  end

  def self.load_genre
    # read from file
    genre_records = []
    File.write('./json/genre.json', []) unless File.exist?('./json/genre.json')
    records = JSON.parse(File.read('./json/genre.json'))
    records.each { |record| genre_records << record['name'] }
    genre_records
  end
end
