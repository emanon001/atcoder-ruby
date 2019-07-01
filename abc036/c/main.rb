class PriorityQueue
  include Enumerable

  MIN = -(2 << 60)

  attr_reader :size

  def initialize(&block)
    @size = 0
    @heap = Array.new
    @get_key = block || :itself.to_proc
  end

  def each
    (1..@size).each do |i|
      yield @heap[i]
    end
  end

  def pop
    return nil if @size <= 0
    max = @heap[1]
    @heap[1] = @heap[@size]
    @size -= 1
    max_heapify(1)
    max
  end

  def push(x)
    @size += 1
    i = @size
    @heap[i] = x
    while i > 1 && @get_key.call(@heap[i / 2]) < @get_key.call(@heap[i])
      t = @heap[i / 2]
      @heap[i / 2] = @heap[i]
      @heap[i] = t
      i = i / 2
    end
  end

  def top
    return nil if @size <= 0
    @heap[1]
  end

  private

  def max_heapify(i)
    l = 2 * i
    r = 2 * i + 1
    largest =
      l <= @size && @get_key.call(@heap[l]) > @get_key.call(@heap[i]) ? l : i
    largest = r \
      if r <= @size && @get_key.call(@heap[r]) > @get_key.call(@heap[largest])
    unless largest == i
      t = @heap[i]
      @heap[i] = @heap[largest]
      @heap[largest] = t
      max_heapify(largest)
    end
  end
end

N = gets.to_i
a_list = N.times.map { gets.to_i }
pq = PriorityQueue.new do |(a, i)|
  -a
end
a_list.each.with_index do |a, i|
  pq.push([a, i])
end
b_list = Array.new(N)
max = -1
current = nil
while pq.size > 0
  a, i = pq.pop
  if a != current
    current = a
    max += 1
  end
  b_list[i] = max
end
b_list.each { |b| puts b }
