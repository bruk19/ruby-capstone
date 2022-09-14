require 'json'

module BooksPreserve
  def store_books
    bookstore = []
    @books.each do |book|
      bookstore << { id: book.id,
                     publisher: book.publisher,
                     cover_state: book.cover_state,
                     publish_date: book.publish_date,
                     archived: book.archived, label: book.title }
    end
    File.write('./json/book.json', bookstore.to_json)
  end

  def load_books
    bookstore = []
    book_file = File.open('./json/book.json')
    if File.exist?(book_file) && File.read(book_file) != ''
      data = JSON.parse(book_file.read)
      data.each do |book|
        bookstore << Book.new(book['publisher'], book['cover_state'], book['publish_date'], book['archived'],
                              book['label'], book['id'])
      end
    else
      File.write(book_file, '[]')
    end
    bookstore
  end
end
