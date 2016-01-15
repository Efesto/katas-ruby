class StringSum

  def self.sum(*strings)
    sum = 0
    strings.each do |string|
      sum = sum + [0, string.to_i].max

    end
    sum
  end


end