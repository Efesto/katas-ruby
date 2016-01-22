class LCD
  attr_reader :screens

  def initialize(number)
    @screens = []
    init_screens(number)
  end

  def init_screens(number)
    number.to_s.reverse.chars.each do |char|
      @screens << case char
                    when '0'
                      [false,true,false,true,false,true,true,true,true]
                    when '1'
                      [false, false, false, false, false, true, false, false, true]
                    when '2'
                      [false, true, false, false, true, true, true, true, false]
                    when '3'
                      [false, true, false, false, true, true, false, true, true]
                    when '4'
                      [false, false, false, true, true, true, false, false, true]
                    when '5'
                      [false, true, false, true, true, false, false, true, true]
                    when '6'
                      [false, true, false, true, true, false, false, true, true]
                    when '7'
                      [false, true, false, true, true, false, false, true, true]
                    when '8'
                      [false, true, false, true, true, false, false, true, true]

    end

    end
  end


end