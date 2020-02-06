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
edges = M.times.map { gets.split.map(&:to_i) }
# [[u, cost, edge], ...]
graph = Array.new(N) { [] }
edges.each.with_index do |(u, v, c), i|
  u -= 1
  v -= 1
  graph[u].push([v, c, i])
  graph[v].push([u, c, i])
end

def shortest_path(graph, s)
  # [[cost, path], ...]
  w_list = Array.new(graph.size, [1 << 60, []])
  w_list[s] = [0, []]
  queue = PriorityQueue.new
  queue.push([s, 0, []])
  while !queue.empty?
    u, w, path = queue.pop
    next if w > w_list[u][0]
    graph[u].each do |(v, c, edge)|
      if w_list[v][0] > w_list[u][0] + c
        new_cost = w_list[u][0] + c
        new_path = path.dup
        new_path.push(edge)
        w_list[v] = [new_cost, new_path]
        queue.push([v, new_cost, new_path])
      end
    end
  end
  w_list
end

require 'set'

set = Set.new
N.times do |u|
  path_list = shortest_path(graph, u)
  path_list.each do |_, path|
    set.merge(path)
  end
end
ans = M - set.size
puts ans