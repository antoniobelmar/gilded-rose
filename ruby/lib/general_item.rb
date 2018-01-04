class General_Item
  def initialize(item)
    @item = item
  end

  def update_quality
    if @item.quality > 0
      @item.quality -=1
    end
    if @item.sell_in < 0 && @item.quality > 0
      @item.quality -=1
    end
  end

  def update_sell_in
    @item.sell_in -= 1
  end

end
