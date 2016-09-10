class OddEven
  def self.numbers(range_size)
    (0..range_size).map do |number|
      to_add = number
      if number.even?
        to_add = 'even'
      elsif number.odd?
        to_add = 'odd'
      end
      to_add
    end
  end

  Fixnum.class_eval do
    def even?
      divisible_by_and_not? 2
    end

    def odd?
      divisible_by_and_not?(3) || divisible_by_and_not?(5)
    end

    def divisible_by_and_not?(divider)
      self != divider && (self % divider).zero?
    end
  end
end
