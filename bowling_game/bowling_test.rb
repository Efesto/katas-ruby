require_relative '../test_case'
require_relative 'bowling_play'

class BowlingTest < Test::Unit::TestCase

  setup do
    @bowling_play = BowlingPlay.new
  end

  def test_frames_score_spare
    pins_hit 1, 9, 5

    @bowling_play.throw_ball
    assert_equal 1, @bowling_play.score(0)

    @bowling_play.throw_ball
    assert_equal 10, @bowling_play.score(0)

    @bowling_play.throw_ball
    assert_equal 15, @bowling_play.score(0)
    assert_equal 5, @bowling_play.score(1)
  end

  def test_frames_score_strike
    pins_hit 10, 8, 1

    @bowling_play.throw_ball
    assert_equal 10, @bowling_play.score(0)

    @bowling_play.throw_ball
    assert_equal 18, @bowling_play.score(0)
    assert_equal 8, @bowling_play.score(1)

    @bowling_play.throw_ball
    assert_equal 19, @bowling_play.score(0)
    assert_equal 9, @bowling_play.score(1)
  end

  def test_strike_bonus_after_strike
    pins_hit(10,10,10)
    3.times { @bowling_play.throw_ball }

    assert_equal 30, @bowling_play.score(0)
  end


  def test_last_frame_strike

    pins_hit(10,10,10,10,10,10,10,10,10,10,1,1)
    10.times { @bowling_play.throw_ball}

    assert_equal 10, @bowling_play.score(9)

    @bowling_play.throw_ball
    assert_equal 11, @bowling_play.score(9)

    @bowling_play.throw_ball
    assert_equal 12, @bowling_play.score(9)
    assert_equal 275, @bowling_play.total_score
  end


  def pins_hit(*pins)
    BowlingPlay.any_instance.stubs(:pins_hit).returns(*pins)
  end
end