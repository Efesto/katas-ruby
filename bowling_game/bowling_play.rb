require_relative 'frame'

module Bowling
  class BowlingPlay
    MAX_FRAMES = 10

    def initialize
      @current_frame_index = 0
      @frames = []
    end

    def throw_ball
      throw_pins_hit = pins_hit

      current_frame = @frames[@current_frame_index]

      if current_frame.nil?
        current_frame = Bowling::Frame.new
        @frames << current_frame
      end

      current_frame.throws << throw_pins_hit

      @throw_again = current_frame.throws.length < 2 && throw_pins_hit < 10
      @current_frame_index += 1 unless @throw_again
    end

    def total_score
      (0..MAX_FRAMES).inject { |a, e| a + score(e - 1) }
    end

    def score(frame_index)
      @frames[frame_index].score + spare_bonus(frame_index) + strike_bonus(frame_index)
    end

    def spare_bonus(frame_index)
      frame = @frames[frame_index]
      if frame_throws_count_is_equal_to(frame, 2) &&
          frame_score_is_max(frame) &&
          !frame_is_the_last(frame_index)
        @frames[frame_index + 1].throws[0]
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
        bonus = next_frame.throws[0]
        if frame_throws_count_is_equal_to(next_frame, 2)
          bonus += next_frame.throws[1]
        elsif @frames[frame_index + 2]
          bonus += @frames[frame_index + 2].throws[0]
        end
      end
      bonus
    end

    def frame_score_is_max(frame)
      frame.score == 10
    end

    def frame_throws_count_is_equal_to(frame, count)
      frame.throws.length == count
    end

    def frame_is_the_last(frame_index)
      @frames.length <= frame_index + 1
    end

    def pins_hit
    end
  end
end
