# won't actually run, but this is a sample implementation
# of how a heap could be constructed

# insertion O(log n)
# pop_min O(log n)

class Heap
  def initialize(vals = [])
    @store = []
    vals.each {|val| insert(val)}
  end

  def peek_min
    @store.first
  end

  def pop_min
    return nil if @store.empty?

    # swap because it could destroy the tree structure of the heap
    swap!(0, @store.length - 1)
    min = @store.pop
    heapify_down!

    min
  end

  def parent_idx(i)
    i.zero? ? nil : (i-1)/2
  end

  def children_idx(i)
    # bounds check so we don't get out of bounds children
    [2*i+1, 2*i+2].select {|idx| idx < @store.length}
  end
  # always insert at the tail node
  def insert(val)
    @store.push(val)
    heapify_up!
    self
  end

  def swap!(a, b)
    @store[a], @store[b] = @store[b], @store[a]
  end

  def heapify_up!
    # method O(log n) because we have to go through the depth
    # of the tree in the worst case scenario

    i = @store.length - 1

    while i > 0
      parent = parent_idx(i)
      if @store[i] < @store[parent]
        swap!(i, parent)
        i = parent
      else
        break
      end
    end
  end

  def heapify_down!
    i = 0

    while true
      # returns index of the smallest child

      small = children_idx(i).min_by { |idx| @store[idx] }
      break if small.nil?
      if @store[i] > @store[small]
        swap(i, small)
        i = small
      else
        break
      end
    end
  end
end
