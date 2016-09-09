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

      current_frame.add_throw throw_pins_hit
      @current_frame_index += 1 if current_frame.ended?
    end

    def score
      total_score = 0
      (0..[@frames.length, MAX_FRAMES].min - 1).each do |index|
        total_score += @frames[index].score + spare_bonus(index) + strike_bonus(index)
      end
      total_score
    end

    def spare_bonus(frame_index)
      bonus = 0
      frame = @frames[frame_index]

      if frame.spare? && !last_frame?(frame_index)
        bonus = @frames[frame_index + 1].first_throw
      end
      bonus
    end

    def strike_bonus(frame_index)
      bonus = 0
      frame = @frames[frame_index]

      if frame.strike? && !last_frame?(frame_index)
        next_frame = @frames[frame_index + 1]
        bonus = next_frame.score

        bonus += @frames[frame_index + 2].first_throw if next_frame.strike?
      end
      bonus
    end

    def last_frame?(frame_index)
      @frames.length <= frame_index + 1
    end

    def pins_hit
    end
  end
end
