require_relative './label'

module LabelModule
  def list_all_labels
    if @labels.empty?
      puts 'There is no labels'
    else
      puts 'List of labels'
      puts
      @labels.each_with_index do |label, index|
        puts "#{index}) Label Title: '#{label.title}' Label Color: '#{label.color}'"
        puts
      end
    end
  end
end