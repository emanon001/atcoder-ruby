class PriorityQueue
  def initialize(&block)
    @size = 0
    @heap = Array.new
    @block = block
  end

  def insert(x)
    @size += 1
    i = @size - 1
    @heap[i] = nil
    increase_key(i, x)
  end

  private

  def increase_key(i, x)
    key = @block.call(x)
    fail 'key < @heap[i]' if key < @heap[i]
    @heap[i] = x
    # TODO:
  end
end
