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


N, M, R = gets.split.map(&:to_i)
rs = gets.split.map { |s| s.to_i - 1 }
edges = M.times.map { gets.split.map(&:to_i) }
graph = Array.new(N) { [] }
edges.each do |(u, v, c)|
  u -= 1
  v -= 1
  graph[u].push([v, c])
  graph[v].push([u, c])
end

def shortest_path(graph, s)
  w_list = Array.new(graph.size, 1 << 60)
  w_list[s] = 0
  queue = PriorityQueue.new
  queue.push([s, 0])
  while !queue.empty?
    v, w = queue.pop
    next if w > w_list[v]
    graph[v].each do |(u, c)|
      if w_list[u] > w_list[v] + c
        w_list[u] = w_list[v] + c
        queue.push([u, w_list[u]])
      end
    end
  end
  w_list
end

ds = {}
rs.each do |r|
  ds[r] = shortest_path(graph, r)
end

def dfs(rs, u, sum_d, ds)
  return sum_d if rs.size == 0
  rs.map do |r|
    trs = rs.dup
    trs.delete(r)
    dfs(trs, r, sum_d + ds[u][r], ds)
  end.min
end

ans = rs.map do |r|
  trs = rs.dup
  trs.delete(r)
  dfs(trs, r, 0, ds)
end.min
puts ans
