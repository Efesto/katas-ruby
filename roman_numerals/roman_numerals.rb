module RomansNumerals
  refine Fixnum do
    def to_roman
      roman_number = ''
      arabic_number = self
      const_numerals = {
          1000 => 'M',
          500 => 'D',
          100 => 'C',
          50 => 'L',
          10 => 'X',
          5 => 'V'
      }

      while arabic_number > 0
        numeral = const_numerals.find { |key, value| arabic_number == key - 1 }

        if numeral
          roman_number << "I#{numeral[1]}"
          arabic_number = arabic_number - (numeral[0] - 1)
        else
          numeral = const_numerals.find { |key, value| arabic_number >= key }
          if numeral
            roman_number << numeral[1]
            arabic_number = arabic_number - (numeral[0])
          else
            arabic_number.times { roman_number << 'I' }
            arabic_number = 0
          end
        end

      end

      roman_number
    end
  end
end