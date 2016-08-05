class OddEven

  def self.numbers range_size
    (0..range_size).map do |number|
      to_add = number
      if number.is_even?
        to_add = 'even'
      elsif number.is_odd?
        to_add = 'odd'
      end
      to_add
    end
  end

  Fixnum.class_eval do
    def is_even?
      is_divisible_by 2
    end

    def is_odd?
      is_divisible_by(3) || is_divisible_by(5)
    end

    def is_divisible_by divider
      self != divider && self % divider == 0
    end
  end
end