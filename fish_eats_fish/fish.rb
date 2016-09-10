class Fish
  attr_reader :size, :direction

  def initialize(size, direction)
    @direction = direction
    @size = size
  end
end
