require_relative '../test_case'
require_relative 'lcd'

class LCDTest < Test::Unit::TestCase

  setup do

  end
  def test_zero
    assert_screen_is_for 0, [false, true, false, true, false, true, true, true, true]
    assert_screen_is_for 1, [false, false, false, false, false, true, false, false, true]
    assert_screen_is_for 2, [false, true, false, false, true, true, true, true, false]
    assert_screen_is_for 3, [false, true, false, false, true, true, false, true, true]
    assert_screen_is_for 4, [false, false, false, true, true, true, false, false, true]
    assert_screen_is_for 5, [false, true, false, true, true, false, false, true, true]
    assert_screen_is_for 6, [false, false, false, true, true, true, false, false, true]
  end

  private

  def assert_screen_is_for number, expected_screen
    lcd_screens = LCD.new(number).screens
    assert_equal expected_screen, lcd_screens[0]
  end


end