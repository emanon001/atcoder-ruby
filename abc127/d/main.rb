class PriorityQueue
  MIN = -(2 << 60)

  attr_reader :size

  def initialize(&block)
    @size = 0
    @heap = Array.new
    @get_key = block || :itself.to_proc
  end

  def empty?
    size == 0
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

  def to_a
    return [] if @size == 0
    @heap[1..@size]
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

N, M = gets.split.map(&:to_i)
a_list = gets.split.map(&:to_i)
bc_list = M.times.map { gets.split.map(&:to_i) }
sorted = bc_list.sort_by { |(_, c)| -c }
pq = PriorityQueue.new { |a| -a } # 小さい値を優先
a_list.each { |a| pq.push(a) }
sorted.each do |(b, c)|
  while b > 0 && c > pq.top
    pq.pop
    pq.push(c)
    b -= 1
  end
end
ans = pq.to_a.reduce(&:+)
puts ans
