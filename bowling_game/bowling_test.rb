require_relative '../test_case'
require_relative 'bowling_play'

class BowlingTest < Test::Unit::TestCase

  setup do
    @bowling_play = BowlingPlay.new
  end

  def test_frame_score_simple

    BowlingPlay.any_instance.stubs(:pins_hit).returns(1)

    assert_equal 0, @bowling_play.current_score
    assert_equal 10, @bowling_play.current_pins
    assert_equal 0, @bowling_play.current_throws

    @bowling_play.throw_ball
    assert_equal 1, @bowling_play.current_score
    assert_equal 9, @bowling_play.current_pins
    assert_equal 1, @bowling_play.current_throws

    @bowling_play.throw_ball
    assert_equal 2, @bowling_play.current_score
    assert_equal 8, @bowling_play.current_pins
    assert_equal 2, @bowling_play.current_throws

    @bowling_play.throw_ball
    assert_equal 3, @bowling_play.current_score
    assert_equal 9, @bowling_play.current_pins
    assert_equal 3, @bowling_play.current_throws
  end

  def test_frame_score_spare
    BowlingPlay.any_instance.stubs(:pins_hit).returns(5,5)

    @bowling_play.throw_ball
    @bowling_play.throw_ball
    assert_equal 0, @bowling_play.current_pins
    assert_equal 15, @bowling_play.current_score


  end
end