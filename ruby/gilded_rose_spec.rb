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
  end

end
