class BowlingPlay
  MAX_FRAMES = 10

  def initialize
    @current_frame = 0
    @frames = []
    @frame_throw = 0
  end

  def throw_ball
    throw_pins_hit = pins_hit

    if @frames[@current_frame].nil?
      @frames << [throw_pins_hit]
    else
      @frames[@current_frame] << throw_pins_hit
    end

    @frame_throw = @frame_throw.zero? && throw_pins_hit < 10 ? 1 : 0
    @current_frame += 1 if @frame_throw.zero?
  end

  def total_score
    (0..MAX_FRAMES).inject { |a, e| a + score(e - 1) }
  end

  def score(frame)
    simple_score(frame) + spare_bonus(frame) + strike_bonus(frame)
  end

  def simple_score(frame)
    @frames[frame].inject { |a, e| a + e }
  end

  def spare_bonus(frame)
    if frame_throws_count(frame) == 2 && frame_score_is_max(frame) && !frame_is_the_last(frame)
      @frames[frame + 1][0]
    else
      0
    end
  end

  def strike_bonus(frame)
    bonus = 0
    if frame_throws_count(frame) == 1 && frame_score_is_max(frame) && !frame_is_the_last(frame)
      next_frame = @frames[frame + 1]
      bonus = next_frame[0]
      if frame_throws_count(next_frame) == 2
        bonus += next_frame[1]
      elsif @frames[frame + 2]
        bonus += @frames[frame + 2][0]
      end
    end
    bonus
  end

  def frame_score_is_max(frame)
    simple_score(frame) == 10
  end

  def frame_throws_count(frame)
    @frames[frame].length
  end

  def frame_is_the_last(frame)
    @frames.length <= frame + 1
  end

  def pins_hit
  end
end
