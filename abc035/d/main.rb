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

N, M, T = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

a_graph = Array.new(N) { [] }
b_graph = Array.new(N) { [] }
M.times do
  a, b, c = gets.split.map(&:to_i)
  a -= 1
  b -= 1
  a_graph[a].push([b, c])
  b_graph[b].push([a, c])
end

def shortest_path(graph, s)
  w_list = Array.new(graph.size, 1 << 60)
  w_list[s] = 0
  queue = PriorityQueue.new do |_, c|
    -c
  end
  queue.push([s, 0])
  while !queue.empty?
    u, w = queue.pop
    next if w > w_list[u]
    graph[u].each do |v, c|
      if w_list[u] + c < w_list[v]
        new_cost = w_list[u] + c
        w_list[v] = new_cost
        queue.push([v, new_cost])
      end
    end
  end
  w_list
end

a_cost = shortest_path(a_graph, 0)
b_cost = shortest_path(b_graph, 0)
ans = 0
N.times do |i|
  cost = a_cost[i] + b_cost[i]
  next if cost >= T
  point = A[i] * (T - cost)
  ans = point if point > ans
end
puts ans