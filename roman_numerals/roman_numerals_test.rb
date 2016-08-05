require_relative '../test_case'
require_relative 'roman_numerals.rb'

class RomanNumeralsTest < Test::Unit::TestCase
  using RomanNumerals

  setup do
    @test_cases = {
        'I' => 1,
        'II' => 2,
        'III' => 3,
        'IV' => 4,
        'V' => 5,
        'VI' => 6,
        'VII' => 7,
        'VIII' => 8,
        'IX' => 9,
        'X' => 10,
        'XXIX' => 29,
        'XXXIII' => 33,
        'XLV' => 45,
        'XLVIII' => 48,
        'XLIX' => 49,
        'L' => 50,
        'XC' => 90,
        'XCIX' => 99,
        'C' => 100,
        'CD' => 400,
        'D' => 500,
        'CM' => 900,
        'M' => 1000,
        'CMXCIX' => 999,
        'MCM' => 1900,
        'MMXVI' => 2016
    }
  end

  def test_from_arabic_to_roman
    @test_cases.each do |test_case|
      assert_is_roman_equal test_case[0], test_case[1]
    end
  end

  def test_from_roman_to_arabic
    @test_cases.each do |test_case|
      assert_is_arabic_equal test_case[1], test_case[0]
    end
  end

  private

  def assert_is_roman_equal(expected, arabic)
    assert_equal expected, arabic.to_roman, "for #{arabic}"
  end

  def assert_is_arabic_equal(expected, actual)
    assert_equal expected, actual.to_arabic, "for #{actual}"
  end
end