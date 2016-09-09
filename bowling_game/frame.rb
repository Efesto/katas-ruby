module Bowling
  class Frame

    def initialize(*scores)
      @throws = *scores
    end

    attr_accessor :throws
  end
end