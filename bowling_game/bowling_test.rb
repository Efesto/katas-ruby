require_relative '../test_case'
require_relative 'bowling_play'

class BowlingTest < Test::Unit::TestCase
  setup do
    @bowling_play = Bowling::BowlingPlay.new
  end

  def test_frame_score
    assert_equal 1, Bowling::Frame.new(1).score
    assert_equal 5, Bowling::Frame.new(1, 4).score
  end

  def test_frames_score_spare
    pins_hit 1, 9, 5

    @bowling_play.throw_ball
    assert_equal 1, @bowling_play.score

    @bowling_play.throw_ball
    assert_equal 10, @bowling_play.score

    @bowling_play.throw_ball
    assert_equal 20, @bowling_play.score
  end

  def test_strike_bonus_after_strike
    pins_hit(10, 1, 1)
    3.times { @bowling_play.throw_ball }

    assert_equal 14, @bowling_play.score
  end

  def test_perfect_game
    pins_hit(10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10)
    12.times { @bowling_play.throw_ball }

    assert_equal 300, @bowling_play.score
  end

  def pins_hit(*pins)
    Bowling::BowlingPlay.any_instance.stubs(:pins_hit).returns(*pins)
  end
end
