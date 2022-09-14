require './options'

class App
  def initialize
    @options = Options.new
  end

  def start_app
    until @options.show_options
      value = gets.chomp
      if value == '0'
        puts 'Thank You for using this app!'
        break
      end
      @options.chosen_value(value)
      @options.store_books
      @options.store_labels
      @options.add_music_album
      @options.list_all_music_album
    end
  end
end
