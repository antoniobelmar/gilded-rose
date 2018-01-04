class Aged_Brie
  MAX_QUALITY = 50
  QUALITY_INCREMENT = 1
  SELL_IN_INCREMENT = 1

  def initialize(item)
    @item = item
  end

  def update_quality
    if @item.quality < MAX_QUALITY
      @item.quality +=QUALITY_INCREMENT
    end
  end

  def update_sell_in
    @item.sell_in -= SELL_IN_INCREMENT
  end

end
