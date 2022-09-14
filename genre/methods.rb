class RunGenre
  def self.list_all_genres(genre_list)
    if genre_list.empty?
      puts "\nThere are no genres yet."
    else
      puts "################## Genres ##################"
      genre_list.each_with_index do |genre, index|
        puts "#{index}) #{genre.items[0].genre.name}"
      end
    end
  end
end