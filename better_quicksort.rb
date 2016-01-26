
class Array
  def qs!(start_idx = 0, len = length)
    return self if len <= 1

    pivot_idx = partition!(start_idx, len)
    left_start = start_idx
    left_len = pivot_idx - start_idx
    right_start = pivot_idx + 1
    right_len = len - left_len - 1

    qs!(left_start, left_len)
    qs!(right_start, right_len)

    self
  end

  def partition!(start, len)
    pivot_idx = start
    i = pivot_idx + 1

    while i < start + len
      if self[i] < self[pivot_idx]
        swap!(pivot_idx, pivot_idx + 1)
        swap!(pivot_idx, i)
        pivot_idx += 1
      end
      i += 1
    end

    pivot_idx
  end

  def swap!(a, b)
    self[a], self[b] = self[b], self[a]
  end
end
