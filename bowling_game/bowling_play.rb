class BowlingPlay

  attr_reader :current_score, :current_pins, :current_throws

  def initialize
    @current_score = 0
    @current_pins = 10
    @current_throws = 0
  end

  def throw_ball
    if @current_throws % 2 == 0
      @current_pins = 10
    end

    pins_knocked_out = pins_hit

    @current_score = @current_score + pins_knocked_out
    @current_pins = @current_pins - pins_knocked_out
    @current_throws = @current_throws + 1
  end

  def pins_hit

  end
end