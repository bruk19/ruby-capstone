require './label/label'
require './item'

describe Label do
  before :each do
    @label = Label.new('Comedy', 'white')
    @item = Item.new(2, '2000-01-11', false)
    @label.add_item(@item)
  end

  describe '#new' do
    it 'it should return an instance of Label object' do
      expect(@label).to be_instance_of Label
    end

    it 'it should return an instance of Item object' do
      expect(@item).to be_instance_of Item
    end
  end

  
  it 'it should return one item' do
    expect(@label.items.length).to eql 1
  end
  
end