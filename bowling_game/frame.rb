module Bowling
  class Frame

    def initialize(*scores)
      @throws = *scores
    end

    def score
      throws.inject { |a, e| a + e }
    end

    attr_accessor :throws
  end
end