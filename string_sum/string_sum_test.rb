require_relative '../test_case'
require_relative 'string_sum'

class StringSumTest < Test::Unit::TestCase
  def test_sum
    assert_equal 10, StringSum.sum('5', '5')
    assert_equal 13, StringSum.sum('8', '5')
    assert_equal 12, StringSum.sum('12', '0')

  end

  def test_sum_not_natural

    assert_equal 12, StringSum.sum('12', '-5')
    assert_equal 12, StringSum.sum('12', 'pizza')

    assert_equal 12, StringSum.sum('12', '')
    assert_equal 12, StringSum.sum('12', nil)
  end

end