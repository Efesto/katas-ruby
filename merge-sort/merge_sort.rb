class Array
  def merge_sort
    return self if length <= 1

    mid = length / 2

    left_slice = self[0, mid].merge_sort
    right_slice = self[mid, length].merge_sort

    index_left = 0
    index_right = 0
    sorted_array = []

    while index_left < left_slice.length && index_right < right_slice.length
      a = left_slice[index_left]
      b = right_slice[index_right]

      if a <= b
        sorted_array << a
        index_left += 1
      else
        sorted_array << b
        index_right += 1
      end
    end

    sorted_array << left_slice[index_left, left_slice.length]
    sorted_array << right_slice[index_right, right_slice.length]

    sorted_array.flatten
  end
end
