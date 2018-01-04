require 'sulfuras'
require 'item'

describe "Sulfuras" do
  describe 'update_quality' do
    it "ensures sulfuras never decrease in quality" do
      item = Item.new("Sulfuras, Hand of Ragnaros", 2, 10)
      item_type = Sulfuras.new(item)
      item_type.update_quality
      expect(item.quality).to eq(10)
    end
  end
  describe 'update_sell_in' do
    it 'ensures sulfuras sell-in date never decreases' do
      item = Item.new("Sulfuras, Hand of Ragnaros", 2, 10)
      item_type = Sulfuras.new(item)
      item_type.update_sell_in
      expect(item.sell_in).to eq(2)
    end
  end
end
