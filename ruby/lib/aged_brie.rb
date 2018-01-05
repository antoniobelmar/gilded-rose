require 'general_item'

class Aged_Brie < General_Item
  MAX_QUALITY = 50
  QUALITY_INCREMENT = 1

  def initialize(item)
    @item = item
  end

  def update_quality
    if @item.quality < MAX_QUALITY
      @item.quality +=QUALITY_INCREMENT
    end
  end

end
