require_relative './author'
require_relative '../item'

module AuthorModule
  def list_authors
    if is_empty(@authors)
      message('No author in the catalog')
      return
    end
    puts "\n"

    @authors.each_with_index do |author, i|
      puts "#{i + 1}) #{author.first_name} #{author.last_name}"
    end
  end
end
