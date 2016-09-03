
class Array
  def merge_sort

    return self if length <= 1

    mid = self.length / 2

    array = []

    left_slice = self[0,mid].merge_sort
    right_slice = self[mid, length].merge_sort

    index_left = 0
    index_right = 0

    while index_left < left_slice.length && index_right < right_slice.count
      a = left_slice[index_left]
      b = right_slice[index_right]

      if a <= b
        array << a
        index_left += 1
      end

      if b <= a
        array << b
        index_right += 1
      end
    end

    while index_left < left_slice.length
      array << left_slice[index_left]
      index_left +=1
    end

    while index_right < right_slice.length
      array << right_slice[index_right]
      index_right +=1
    end

    array

  end
end