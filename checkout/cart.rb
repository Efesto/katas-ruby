require_relative 'rule'

class Cart
  def initialize(goods)
    @starting_goods = goods
    @goods_in_cart = {}
  end

  def price
    total_price = 0

    each_good do |good|
      total_price += price_of good
    end

    total_price
  end

  def price_of(good)
    @goods_in_cart.merge!({good => 0}) unless @goods_in_cart.has_key? good
    @goods_in_cart[good] = @goods_in_cart[good] + 1
    rules = [
        Rule.new('A', 3, 30, 50),
        Rule.new('B', 2, 15, 30),
        Rule.new('C', 1, 20, 20),
        Rule.new('D', 1, 15, 15)
    ]

    rule = rules.find do |rule|
      rule.can_handle?(good)
    end

    rule.get_price(good, @goods_in_cart)
  end

  def each_good(&block)
    @starting_goods.split(//).each do |good|
      block.call(good)
    end
  end
end