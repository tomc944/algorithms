# this won't run - just to remember how this is implemented
# get is the only method available to the user
# private method that ejects as needed
# head is least used node
# tail is most recently used node

class LRUCache
  def initalize(prc, size=8)
    @map = {}
    @list = LinkedList.new
    @size = size
    @count = 0
    @prc = prc
  end

  def get(query)
    # O(1)
    if @map[query]
      # O(1)
      @list.move_to_tail(@map[query])
      return @map[query].values
    else
      # O(1)
      eject! if @count == size
      new_link = @list.push(query, prc.call(query))
      @map(query) = new_link
      @count += 1
      new_link.val
    end
  end

  private
  def eject!
    # O(1)
    link = @list.shift
    @map.delete(link.key)
    @count -= 1
  end
end
