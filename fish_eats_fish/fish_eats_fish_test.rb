require 'test/unit'
require_relative 'fish_eats_fish'

class FishEatsFishTest < Test::Unit::TestCase
  def test_only_one_surviving_fish
    @fishes = [
      Fish.new(10, 0),
      Fish.new(5, 1),
      Fish.new(1, 1)
    ]

    assert_survivors_sizes_are 10
  end

  def test_all_fishes_survive
    @fishes = [
      Fish.new(10, 0),
      Fish.new(5, 0),
      Fish.new(1, 0)
    ]

    assert_survivors_sizes_are 10, 5, 1
  end

  def test_some_fish_dies
    @fishes = [
      Fish.new(1, 0),
      Fish.new(10, 1),
      Fish.new(5, 0),
      Fish.new(2, 1)
    ]

    assert_survivors_sizes_are 10, 5
  end

  def test_some_fish_nevermind
    @fishes = [
      Fish.new(1, 0),
      Fish.new(10, 1),
      Fish.new(3, 1),
      Fish.new(5, 0),
      Fish.new(2, 1)
    ]

    assert_survivors_sizes_are 10, 3, 5
  end

  def assert_survivors_sizes_are(*expected_sizes)
    assert_equal expected_sizes, FishEatsFish.survivors(@fishes).map(&:size)
  end
end
