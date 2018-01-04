class Backstage_Passes

  def initialize(item)
    @item = item
  end

  def update_quality
    if @item.quality < 50
      @item.quality += 1
    end
    if @item.sell_in < 11 && @item.quality < 50
      @item.quality += 1
    end
    if @item.sell_in < 6 && @item.quality < 50
      @item.quality += 1
    end
    if @item.sell_in <= 0
      @item.quality = 0
    end
  end

  def update_sell_in
    @item.sell_in-=1
  end

end
