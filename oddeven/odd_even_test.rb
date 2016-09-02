require_relative '../test_case'
require_relative 'odd_even'

class OddEvenTest < Test::Unit::TestCase
  def test_first
    numbers = OddEven.numbers 100

    assert_equal ['even', 1, 2, 3, 'even', 5, 'even', 7, 'even', 'odd', 'even', 11, 'even', 13, 'even', 'odd', 'even', 17], numbers[0..17]
  end
end
