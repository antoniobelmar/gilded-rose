require 'conjured'
require 'item'

describe 'Conjured' do
  describe 'update_quality' do
    it 'reduces quality of a conjured item by 2 before sell by date has passed' do
      item = Item.new("Conjured", 10, 10)
      item_type = Conjured.new(item)
      item_type.update_quality
      expect(item.quality).to eq(8)
    end
    it "reduces quality of a non-edge case item by 4 once sell by date has passed" do
      item = Item.new("Conjured", -1, 10)
      item_type = Conjured.new(item)
      item_type.update_quality
      expect(item.quality).to eq(6)
    end
    it "ensures quality of an item is never negative" do
      item = Item.new("Conjured", -1, 0)
      item_type = Conjured.new(item)
      item_type.update_quality
      expect(item.quality).to eq(0)
    end
  end
  describe 'update_sell_in' do
    it 'reduces sell-in date by 1' do
      item = Item.new("Conjured", 8, 10)
      item_type = Conjured.new(item)
      item_type.update_sell_in
      expect(item.sell_in).to eq(7)
    end
  end
end
