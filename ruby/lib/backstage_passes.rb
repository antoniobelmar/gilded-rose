class Backstage_Passes
  MAX_QUALITY = 50
  MIN_QUALITY = 0
  QUALITY_INCREMENT = 1
  SELL_IN_INCREMENT = -1
  EXPIRES_BY = 0
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

  def update_sell_in
    @item.sell_in += SELL_IN_INCREMENT
  end

end
