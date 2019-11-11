class PriorityQueue
  MIN = -(1 << 60)

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
    while i > 1 && (@get_key.call(@heap[i / 2]) <=> @get_key.call(@heap[i])) < 0
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
      l <= @size && (@get_key.call(@heap[l]) <=> @get_key.call(@heap[i])) > 0 ? l : i
    largest = r \
      if r <= @size && (@get_key.call(@heap[r]) <=> @get_key.call(@heap[largest])) > 0
    unless largest == i
      t = @heap[i]
      @heap[i] = @heap[largest]
      @heap[largest] = t
      max_heapify(largest)
    end
  end
end

N, M = gets.split.map(&:to_i)
lrcs = M.times.map { gets.split.map(&:to_i) }
imos = Array.new(N, 0)
graph = Array.new(N) { [] }
lrcs.each do |(l, r, c)|
  l -= 1
  r -= 1
  graph[l].push([r, c])
  imos[l] += 1
  imos[r] -= 1
end
current = 0
imos.each.with_index do |n, i|
  current += n
  graph[i + 1].push([i, 0]) if current > 0
end

MAX = 1 << 60

def shortest_path(graph, s)
  c_list = Array.new(graph.size, MAX)
  c_list[s] = 0
  queue = PriorityQueue.new do |(_, c)|
    -c
  end
  queue.push([s, 0])
  while !queue.empty?
    v, c = queue.pop
    next if c > c_list[v]
    graph[v].each do |(u, c)|
      if c_list[u] > c_list[v] + c
        c_list[u] = c_list[v] + c
        queue.push([u, c_list[u]])
      end
    end
  end
  c_list
end

ans = shortest_path(graph, 0)[N - 1]
if ans == MAX
  puts '-1'
else
  puts ans
end
