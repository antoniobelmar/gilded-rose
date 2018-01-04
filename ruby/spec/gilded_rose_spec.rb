require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
    it "reduces quality of a non-edge case item by 1" do
      items = [Item.new("foo", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(9)
    end
    it "reduces quality of a non-edge case item by 2 once sell by date has passed" do
      items = [Item.new("foo", -1, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(8)
    end
    it "ensures quality of an item is never negative" do
      items = [Item.new("foo", -1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end
    it "ensures aged brie increases in quality" do
      items = [Item.new("Aged Brie", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(1)
    end
    it "ensures quality of an items is never above 50" do
      items = [Item.new("Aged Brie", 1, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end
    it "ensures Sulfuras never decrease in quality" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(40)
    end
    it "Ensures backstage passes increase in quality by 1 when > 10 days for sell-in" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(41)
    end
    it "Ensures backstage passes increase in quality by 1 when < 10 and >5 days for sell-in" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(42)
    end
    it "Ensures backstage passes increase in quality by 1 when < 5 and >=0 days for sell-in" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(43)
    end
    it "Ensures backstage passes quality drops to 0 when <0 days for sell-in" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end
    it "Ensures sell-in for a non-edge case decreases by 1" do
      items = [Item.new("foo", 1, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(0)
    end
    it "Ensures sell-in for Sulfuras never decreases" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(1)
    end
    it "Ensures conjured items quality degrades twice as fast as normal items before sell-in date" do
      items = items = [Item.new("Conjured", 1, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(8)
    end
    it "Ensures conjured items quality degrades twice as fast as normal items after sell-in date" do
      items = items = [Item.new("Conjured", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(6)
    end
  end
end
