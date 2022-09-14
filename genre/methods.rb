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
    record = []
    File.write('./json/genre.json', []) unless File.exist?('./json/genre.json')
    records = JSON.parse(File.read('./json/genre.json'))
    records.each { |record| genre_list << genre }
    record
  end
end

# require 'json'
# require './book'
# require './student'
# require './teacher'
# require './rental'

# class Loaddata


#   def self.load_persons
#     # read from file
#     people = []
#     File.write('./data/persons.json', []) unless File.exist?('./data/persons.json')
#     records = JSON.parse(File.read('./data/persons.json'))
#     records.each do |record|
#       person = if record['type'] == 'Student'
#                  Student.new(
#                    nil,
#                    record['age'],
#                    record['name'],
#                    parent_permission: record['parent_permission']
#                  )
#                else
#                  Teacher.new('', record['age'], record['name'])
#                end
#       person.id = record['id']
#       people << person
#     end
#     people
#   end

#   def self.load_rentals(books, persons)
#     # read rental file
#     rentals = []
#     File.write('./data/rentals.json', []) unless File.exist?('./data/rentals.json')
#     data = JSON.parse(File.read('./data/rentals.json'))
#     data.each do |rental|
#       date = rental['date']
#       book = books.select { |b| b.title == rental['book'] }[0]
#       person = persons.select { |ps| ps.name == rental['person'] }[0]

#       # create rental
#       rent = Rental.new(date, book, person)
#       rentals << rent
#     end
#     rentals
#   end
# end

#   def self.write_persons(persons)
#     # write to file
#     persons_record = []
#     File.write('./data/persons.json', []) unless File.exist?('./data/persons.json')
#     persons.each do |person|
#       persons_record << {
#         type: person.class,
#         age: person.age,
#         name: person.name,
#         id: person.id,
#         parent_permission: person.can_use_service?
#       }
#     end
#     data = JSON.generate(persons_record)
#     File.write('data/persons.json', data)
#   end

#   def self.write_rentals(rentals)
#     # write rental
#     rental_records = []
#     File.write('data/rentals.json', []) unless File.exist?('data/rentals.json')
#     rentals.each do |rental|
#       rental_records << {
#         person: rental.person.name,
#         id: rental.person.id,
#         age: rental.person.age,
#         book: rental.book.title,
#         date: rental.date,
#         author: rental.book.author
#       }
#     end
#     data_json = JSON.generate(rental_records)
#     File.write('data/rentals.json', data_json)
#   end
# end