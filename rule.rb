class Rule

  def initialize(good_type, discount_count, discounted_price, full_price)
    @good_type = good_type
    @discount_count = discount_count
    @discounted_price = discounted_price
    @full_price = full_price
  end

  def can_handle?(good)
    good == @good_type
  end

  def get_price(good, goods)
    if goods[good] == @discount_count
      goods[good] = 0
      @discounted_price
    else
      @full_price
    end
  end
end