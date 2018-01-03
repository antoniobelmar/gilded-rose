require File.join(File.dirname(__FILE__), 'gilded_rose')

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
  end

end
