require 'general_item'

class Backstage_Passes < General_Item
  MAX_QUALITY = 50
  QUALITY_INCREMENT = 1
  SIX_DAYS_TO_EXPIRE = 6
  ELEVEN_DAYS_TO_EXPIRE = 11

  def initialize(item)
    @item = item
  end

  def update_quality
    if @item.quality < MAX_QUALITY
      @item.quality += QUALITY_INCREMENT
    end
    if @item.sell_in < ELEVEN_DAYS_TO_EXPIRE && @item.quality < MAX_QUALITY
      @item.quality += QUALITY_INCREMENT
    end
    if @item.sell_in < SIX_DAYS_TO_EXPIRE && @item.quality < MAX_QUALITY
      @item.quality += QUALITY_INCREMENT
    end
    if @item.sell_in <= EXPIRES_BY
      @item.quality = MIN_QUALITY
    end
  end

end
