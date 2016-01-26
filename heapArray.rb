
class Array
  def heap_sort!
    heapify!
    # this method essentially sorts the array
    unheapify!
    # in reverse order, so we must flip it
    reverse!
  end

  def parent_idx(i)
    i.zero? ? nil : (i-1)/2
  end

  def children_idx(i, len)
    [2*i+1, 2*i+2].select {|idx| idx < len}
  end

  def swap!(a, b)
    self[a], self[b] = self[b], self[a]
  end

  def heapify!
    # O(n) not O(log n) despite the nested looping
    len = 1
    while len < self.length
      current = len
      len += 1
      parent = parent_idx(current)
      while self[current] < self[parent]
        swap!(current, parent)
        current = parent
        parent = parent_idx(current)
      end
    end
  end

  def unheapify!
    len = self.length - 1

    while len > 0
      swap!(0, len)
      len -= 1
      current = 0
      children = children_idx(current, len).min_by { |idx| self[idx] }
      while children.any?
        if self[current] < self[children]
          swap!(current, children)
          current = children
        else
          break
        end
      end
    end
  end
end
