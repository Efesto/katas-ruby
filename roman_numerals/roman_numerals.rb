module RomanNumerals
  Fixnum.class_eval do
    def to_roman
      remaining_value = self
      roman_numeral = ''

      while remaining_value.nonzero?
        bigger_roman_numeral = Fixnum.roman_numerals.find do |digit, _numeral|
          remaining_value >= digit
        end
        roman_numeral << bigger_roman_numeral[1]
        remaining_value -= bigger_roman_numeral[0]
      end

      roman_numeral
    end

    def self.roman_numerals
      {
        1000 => 'M',
        900 => 'CM',
        500 => 'D',
        400 => 'CD',
        100 => 'C',
        90 => 'XC',
        50 => 'L',
        40 => 'XL',
        10 => 'X',
        9 => 'IX',
        5 => 'V',
        4 => 'IV',
        1 => 'I'
      }
    end
  end

  String.class_eval do
    def to_arabic
      remaining_value = String.new(self)
      arabic_value = 0

      while remaining_value != ''
        matches = Fixnum.roman_numerals.find_all do |_value, roman_numeral|
          remaining_value.match(/#{roman_numeral}$/)
        end

        # find the match with the biggest roman numeral
        best_match = matches.sort_by { |match| 0 - match[1].length }.first

        # removes the match from the bottom of the buffer
        remaining_value.gsub!(/#{best_match[1]}$/, '')

        # sum the value
        arabic_value += best_match[0]
      end

      arabic_value
    end
  end
end
