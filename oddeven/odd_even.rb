class OddEven
  attr_reader :numbers

  def initialize(range_size)
    @numbers = []
    @range_size = range_size

    (0..range_size).each do |number|
      to_add = number
      if is_even?(number)
        to_add = 'even'
      else
        if is_odd?(number)
          to_add = 'odd'
        end
      end

      @numbers << to_add
    end
  end

  def is_even?(number)
    is_divisible_by number, 2
  end

  def is_odd?(number)
    is_divisible_by(number, 3) || is_divisible_by(number, 5)
  end

  def is_divisible_by(number, divider)
    number % divider == 0 && number != divider
  end
end