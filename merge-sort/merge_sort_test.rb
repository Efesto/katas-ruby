require 'test/unit'
require_relative 'merge_sort'

class MergeSortTest < Test::Unit::TestCase
  def test_sorting
    assert_equal [1, 3, 5, 6, 7, 12, 21], [5, 3, 12, 7, 21, 1, 6].merge_sort
  end
end
