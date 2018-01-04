require 'aged_brie'
require 'item'

describe "Aged Brie" do
  describe 'update_quality' do
    it "ensures aged brie increases in quality" do
      item = Item.new("Aged Brie", 1, 0)
      item_type = Aged_Brie.new(item)
      item_type.update_quality
      expect(item.quality).to eq(1)
    end
    it "still increases quality of aged brie by 1 once sell in date has passed" do
      item = Item.new("Aged Brie", -1, 10)
      item_type = Aged_Brie.new(item)
      item_type.update_quality
      expect(item.quality).to eq(11)
    end
    it "ensures quality of an item is never above 50" do
      item = Item.new("Aged Brie", 1, 50)
      item_type = Aged_Brie.new(item)
      item_type.update_quality
      expect(item.quality).to eq(50)
    end
  end
  describe 'update_sell_in' do
    it 'reduces sell-in date by 1' do
      item = Item.new("Aged Brie", 8, 10)
      item_type = Aged_Brie.new(item)
      item_type.update_sell_in
      expect(item.sell_in).to eq(7)
    end
  end
end
