require 'json'

module AuthorsPreserve
  def store_authors
    authorstore = []
    @authors.each do |author|
      authorstore << { 
                    first_name: author.first_name,
                    last_name: author.last_name
                 }
    end
    File.write('./json/author.json', authorstore.to_json)
  end

  def load_authors
    authorstore = []
    author_file = File.open('./json/author.json')
    if File.exist?(author_file) && File.read(author_file) != ''
      data = JSON.parse(author_file.read)
      data.each do |author|
        authorstore << author.new(author['first_name'], author['last_name'])
      end
    else
      File.write(author_file, '[]')
    end
    authorstore
  end
end