require 'general_item'
require 'item'

describe 'General Item' do
  describe 'update_quality' do
    it 'reduces quality of a non-edge case item by 1' do
      item = Item.new("foo", 10, 10)
      item_type = General_Item.new(item)
      item_type.update_quality
      expect(item.quality).to eq(9)
    end
  end
end
