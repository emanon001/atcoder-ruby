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

N, M, T = gets.split.map(&:to_i)
a_list = gets.split.map(&:to_i)
abc_list = M.times.map { gets.split.map(&:to_i) }
graph1 = Array.new(N) { Array.new }
graph2 = Array.new(N) { Array.new }
abc_list.each do |(a, b, c)|
  a -= 1
  b -= 1
  graph1[a].push([b, c])
  graph2[b].push([a, c])
end

def dijkstra(s, graph)
  pq = PriorityQueue.new { |(_, d)| -d }
  d_list = Array.new(graph.size, 1 << 60)
  d_list[s] = 0
  pq.push([s, 0])
  while !pq.empty?
    v, d = pq.pop
    next if d > d_list[v]
    graph[v].each do |(u, c)|
      if d_list[u] > d_list[v] + c
        d_list[u] = d_list[v] + c
        pq.push([u, d_list[u]])
      end
    end
  end
  d_list
end

d_list1 = dijkstra(0, graph1)
d_list2 = dijkstra(0, graph2)
ans = 0
(0...N).each do |i|
  rest = T - (d_list1[i] + d_list2[i])
  n = rest * a_list[i]
  ans = n if n > ans
end
puts ans
