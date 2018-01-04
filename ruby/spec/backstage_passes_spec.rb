require 'backstage_passes'
require 'item'

describe 'Backstage Passes' do
  describe 'update_quality' do
    it "Ensures backstage passes increase in quality by 1 when > 10 days for sell-in" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 40)
      item_type = Backstage_Passes.new(item)
      item_type.update_quality
      expect(item.quality).to eq(41)
    end
    it "Ensures backstage passes increase in quality by 1 when < 10 and >5 days for sell-in" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 40)
      item_type = Backstage_Passes.new(item)
      item_type.update_quality
      expect(item.quality).to eq(42)
    end
    it "Ensures backstage passes increase in quality by 1 when < 5 and >=0 days for sell-in" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 40)
      item_type = Backstage_Passes.new(item)
      item_type.update_quality
      expect(item.quality).to eq(43)
    end
    it "Ensures backtage passes quality never goes above 50" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 50)
      item_type = Backstage_Passes.new(item)
      item_type.update_quality
      expect(item.quality).to eq(50)
    end
    it "Ensures backstage passes quality drops to 0 when <0 days for sell-in" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 40)
      item_type = Backstage_Passes.new(item)
      item_type.update_quality
      expect(item.quality).to eq(0)
    end
    it "Ensures backstage passes quality never drops below 0" do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 0)
      item_type = Backstage_Passes.new(item)
      item_type.update_quality
      expect(item.quality).to eq(0)
    end
  end
  describe 'update_sell_in' do
    it 'reduces sell_in date by 1' do
      item = Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 50)
      item_type = Backstage_Passes.new(item)
      item_type.update_sell_in
      expect(item.sell_in).to eq(3)
    end
  end
end
