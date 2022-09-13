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
    end
  end
end