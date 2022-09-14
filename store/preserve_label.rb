require 'json'

module LabelsPreserve
  def store_labels
    labelstore = []
    @labels.each do |label|
      labelstore << { title: label.title, color: label.color }
    end
    File.write('./json/label.json', labelstore.to_json)
  end

  def load_labels
    labelstore = []
    label_file = File.open('./json/label.json')
    if File.exist?(label_file) && File.read(label_file) != ''
      data = JSON.parse(label_file.read)
      data.each do |label|
        labelstore << Label.new(label['title'], label['color'])
      end
    else
      File.write(label_file, '[]')
    end
    labelstore
  end
end
