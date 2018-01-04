require './lib/item'
require './lib/aged_brie'
require './lib/backstage_passes'
require './lib/general_item'
require './lib/sulfuras'
require './lib/conjured'

class GildedRose
  CLASS_CHECKER = {"Aged Brie" => Aged_Brie, "Sulfuras, Hand of Ragnaros"=> Sulfuras, "Backstage passes to a TAFKAL80ETC concert"=> Backstage_Passes , "Conjured" => Conjured}
  CLASS_CHECKER.default = General_Item

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item_type = check_class(item)
      item_type.update_quality
      item_type.update_sell_in
    end
  end

  private

  def check_class(item)
    return CLASS_CHECKER[item.name].new(item)
  end

end
