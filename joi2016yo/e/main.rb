class PriorityQueue
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

N, M, K, S = gets.split.map(&:to_i)
P, Q = gets.split.map(&:to_i)
C = K.times.map { gets.to_i }
AB = M.times.map { gets.split.map(&:to_i) }
graph = Array.new(N) { [] }
AB.each do |a, b|
  a -= 1
  b -= 1
  graph[a].push(b)
  graph[b].push(a)
end

INF = 1 << 60

def zombie_distance(graph)
  graph = graph.map(&:dup)
  graph.push([])
  s = graph.size - 1
  C.each do |c|
    c -= 1
    graph[s].push(c)
  end
  ret = Array.new(N)
  queue = [[s, -1]]
  while !queue.empty?
    u, d = queue.shift
    graph[u].each do |v|
      next if ret[v]
      new_d = d + 1
      ret[v] = new_d
      queue.push([v, new_d])
    end
  end
  ret 
end

def shortest_path(graph, s, e, dp)
  w_list = Array.new(graph.size, 1 << 60)
  w_list[s] = 0
  queue = PriorityQueue.new do |_, c|
    -c
  end
  queue.push([s, 0])
  while !queue.empty?
    u, w = queue.pop
    next if w > w_list[u]
    graph[u].each do |v|
      next if dp[v] == 0 # zombie town
      c = if v == e
        0
      else
        dp[v] > S ? P : Q
      end
      if w_list[v] > w_list[u] + c
        w_list[v] = w_list[u] + c
        queue.push([v, w_list[v]])
      end
    end
  end
  w_list
end

d = zombie_distance(graph)
ans = shortest_path(graph, 0, N - 1, d)[N - 1]
puts ans