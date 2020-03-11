class PriorityQueue
  MIN = -(1 << 60)

  attr_reader :size

  def initialize(capacity = nil, &block)
    @size = 0
    @heap = capacity.nil? ? Array.new : Array.new(capacity)
    @key = block || :itself.to_proc
  end

  def empty?
    size == 0
  end

  def push(x)
    i = @size
    @size += 1
    x_key = @key.call(x)
    while i > 0
      parent = (i - 1) / 2
      break if (@key.call(@heap[parent]) <=> x_key) >= 0
      @heap[i] = @heap[parent]
      i = parent
    end
    @heap[i] = x
    nil
  end

  def pop
    return nil if @size <= 0
    ret = @heap[0]
    x = @heap[@size - 1]
    x_key = @key.call(x)
    @size -= 1
    i = 0
    while i * 2 + 1 < @size
      l = i * 2 + 1
      r = i * 2 + 2
      largest = l
      largest_key = @key.call(@heap[l])
      if r < @size
        r_key = @key.call(@heap[r])
        if (r_key <=> largest_key) > 0
          largest = r
          largest_key = r_key 
        end
      end
      break if (x_key <=> largest_key) >= 0
      @heap[i] = @heap[largest]
      i = largest
    end
    @heap[i] = x
    ret
  end

  def top
    return nil if @size <= 0
    @heap[0]
  end

  def to_a
    @heap.take(@size)
  end
end