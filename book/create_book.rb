require_relative './book'
require_relative '../label/label'
require_relative '../item'

class CreateBook
  def initialize(book = 'unknown', label = 'unknown')
    @books = book
    @labels = label
  end

  def add_book
    print 'Publisher Name: '
    publisher = gets.chomp.strip
    print 'Choose state of ook good or bad ? [G/B]: '
    cover_state = gets.chomp.strip.upcase
    case cover_state
    when 'G'
      cover_state = 'good'
    when 'B'
      cover_state = 'bad'
    end
    print 'Enter publish date in [yyyy-mm-dd] format: '
    publish_date = gets.chomp.strip

    puts 'Choose a label or create your own label: '
    @labels.each_with_index do |label, idx|
      puts "Serial No: #{idx + 1}) #{label.title}"
    end
    puts '0) ***** Type zero to create your own label *****'
    new_label = gets.chomp.strip.to_i
    if new_label.zero?
      print 'Please give a label name to your book: '
      title = gets.chomp.strip.upcase
      print 'Please give a color to your label: '
      color = gets.chomp.strip.upcase
      label = Label.new(title, color)
      @labels << label

    else
      title = @labels[new_label - 1].title

    end

    book = Book.new(publisher, cover_state, publish_date, false, title, rand(1000))
    book.move_to_archive
    @books << book

    unless label.nil?

      label.add_item(book)
      book.add_label(label)

    end
    puts 'Book created successfully'
  end
end