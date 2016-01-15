require_relative '../test_case'

class CartTest < Test::Unit::TestCase

  def test_cart_totals
    assert_equal(  0, cart_price(""))
    assert_equal( 50, cart_price("A"))
    assert_equal( 80, cart_price("AB"))
    assert_equal(115, cart_price("CDBA"))
    assert_equal(100, cart_price("AA"))
    assert_equal(130, cart_price("AAA"))
    assert_equal(175, cart_price("AAABB"))
  end

  def cart_price(goods)
    Cart.new(goods).price
  end
end
