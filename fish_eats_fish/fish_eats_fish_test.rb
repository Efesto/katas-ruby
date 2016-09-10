require 'test/unit'
require_relative 'fish_eats_fish'

class FishEatsFishTest < Test::Unit::TestCase
  def test_only_one_surviving_fish
    fishes = [10, 5, 1]
    directions = [0, 1, 1]

    assert_equal [10], FishEatsFish.survivors(fishes, directions)
  end

  def test_all_fishes_survive
    fishes = [10, 5, 1]
    directions = [0, 0, 0]

    assert_equal [10, 5, 1], FishEatsFish.survivors(fishes, directions)
  end

  def test_some_fish_dies
    fishes = [1, 10, 5, 2]
    directions = [0, 1, 0, 1]

    assert_equal [10, 5], FishEatsFish.survivors(fishes, directions)
  end

  def test_some_fish_nevermind
    fishes = [1, 10, 3, 5, 2]
    directions = [0, 1, 1, 0, 1]

    assert_equal [10, 3, 5], FishEatsFish.survivors(fishes, directions)
  end
end
