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

  def score(frame_index)
    simple_score(@frames[frame_index]) + spare_bonus(frame_index) + strike_bonus(frame_index)
  end

  def simple_score(frame)
    frame.inject { |a, e| a + e }
  end

  def spare_bonus(frame_index)
    frame = @frames[frame_index]
    if frame_throws_count_is_equal_to(frame, 2) &&
       frame_score_is_max(frame) &&
       !frame_is_the_last(frame_index)
      @frames[frame_index + 1][0]
    else
      0
    end
  end

  def strike_bonus(frame_index)
    bonus = 0
    frame = @frames[frame_index]
    if frame_throws_count_is_equal_to(frame, 1) &&
       frame_score_is_max(frame) &&
       !frame_is_the_last(frame_index)
      next_frame = @frames[frame_index + 1]
      bonus = next_frame[0]
      if frame_throws_count_is_equal_to(next_frame, 2)
        bonus += next_frame[1]
      elsif @frames[frame_index + 2]
        bonus += @frames[frame_index + 2][0]
      end
    end
    bonus
  end

  def frame_score_is_max(frame)
    simple_score(frame) == 10
  end

  def frame_throws_count_is_equal_to(frame, count)
    frame.length == count
  end

  def frame_is_the_last(frame_index)
    @frames.length <= frame_index + 1
  end

  def pins_hit
  end
end
