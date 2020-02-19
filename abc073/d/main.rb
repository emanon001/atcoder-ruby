class PriorityQueue
  MIN = -(1 << 60)

  attr_reader :size

  def initialize(capacity = nil, &block)
    @size = 0
    @heap = if capacity.nil?
      Array.new
    else
      # capacity には、queue のサイズとしてありえる最大の数を指定する想定。
      # @heap[1] から使用するため、配列サイズを 1つ余分に確保する。
      Array.new(capacity + 1)
    end
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
r_list = gets.split.map { |a| a.to_i - 1}
graph = Array.new(N) { [] }
M.times do
  u, v, c = gets.split.map(&:to_i)
  u -= 1
  v -= 1
  graph[u].push([v, c])
  graph[v].push([u, c])
end

def shortest_path(graph, s)
  w_list = Array.new(graph.size, 1 << 60)
  w_list[s] = 0
  queue = PriorityQueue.new(graph.size) do |_, c|
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

d = {}
r_list.map do |r|
  d[r] = shortest_path(graph, r)
end

ans = 1 << 60
r_list.permutation.each do |l|
  ret = 0
  u = l[0]
  l.each do |v|
    ret += d[u][v]
    u = v
  end
  ans = ret if ret < ans
end
puts ans