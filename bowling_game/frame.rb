module Bowling
  class Frame
    def initialize(*scores)
      @throws = *scores
    end

    def score
      throws.inject { |a, e| a + e }
    end

    def max_score?
      score == 10
    end

    def spare?
      max_score? && throws.length == 2
    end

    def strike?
      max_score? && throws.length == 1
    end

    def ended?
      max_score? || throws.length == 2
    end

    attr_accessor :throws
  end
end
