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
    it "reduces quality of a non-edge case item by 2 once sell by date has passed" do
      item = Item.new("foo", -1, 10)
      item_type = General_Item.new(item)
      item_type.update_quality
      expect(item.quality).to eq(8)
    end
    it "ensures quality of an item is never negative" do
      item = Item.new("foo", -1, 0)
      item_type = General_Item.new(item)
      item_type.update_quality
      expect(item.quality).to eq(0)
    end
  end
  describe 'update_sell_in' do
    it 'reduces sell-in date by 1' do
      item = Item.new("foo", 8, 10)
      item_type = General_Item.new(item)
      item_type.update_sell_in
      expect(item.sell_in).to eq(7)
    end
  end
end
