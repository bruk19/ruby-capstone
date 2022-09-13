require_relative './book'
require_relative '../item'

module BookModule
  def list_all_books
    if @books.empty?
      puts 'There is no books in the catalog'
    else
      puts 'Book(s) in the catalog'
      puts
      @books.each_with_index do |book, index|
        print "#{index} Publisher: '#{book.publisher}', Publish Date: '#{book.publish_date}',"
        print " Cover state: '#{book.cover_state}',  Archived: '#{book.archived}' ,  Label: '#{book.title}'"
        puts
      end
    end
  end

  
end