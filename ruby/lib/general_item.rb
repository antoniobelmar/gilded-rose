class General_Item
  MIN_QUALITY = 0
  QUALITY_INCREMENT = -1
  SELL_IN_INCREMENT = -1
  EXPIRES_BY = 0

  def initialize(item)
    @item = item
  end

  def update_quality
    if @item.quality > MIN_QUALITY
      @item.quality += QUALITY_INCREMENT
    end
    if @item.sell_in < EXPIRES_BY && @item.quality > MIN_QUALITY
      @item.quality += QUALITY_INCREMENT
    end
  end

  def update_sell_in
    @item.sell_in += SELL_IN_INCREMENT
  end

end
