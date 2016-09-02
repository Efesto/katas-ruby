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
    (0..MAX_FRAMES).inject { |sum, frame| sum + score(frame - 1) }
  end

  def score(frame)
    simple_score(frame) + spare_bonus(frame) + strike_bonus(frame)
  end

  def simple_score(frame)
    @frames[frame].inject { |sum, score| sum + score }
  end

  def spare_bonus(frame)
    if @frames[frame].length == 2 && simple_score(frame) == 10 && @frames.length > frame + 1
      @frames[frame + 1][0]
    else
      0
    end
  end

  def strike_bonus(frame)
    bonus = 0
    if @frames[frame].length == 1 && simple_score(frame) == 10 && @frames.length > frame + 1
      next_frame = @frames[frame + 1]
      bonus = next_frame[0]
      if next_frame.length == 2
        bonus += next_frame[1]
      elsif @frames[frame + 2]
        bonus += @frames[frame + 2][0]
      end
    end
    bonus
  end

  def pins_hit
  end
end
