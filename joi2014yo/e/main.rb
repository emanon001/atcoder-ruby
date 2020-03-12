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

N, K = gets.split.map(&:to_i)
CR = N.times.map { gets.split.map(&:to_i) }
AB = K.times.map do
  a, b = gets.split.map(&:to_i)
  [a - 1, b - 1]
end
graph = Array.new(N) { [] }
AB.each do |a, b|
  graph[a].push(b)
  graph[b].push(a)
end

require 'set'
def reachable_vertexes(graph, s, max_c)
  set = Set.new([s])
  queue = [[s, 0]]
  while !queue.empty?
    u, c = queue.shift
    graph[u].each do |v|
      next if set.include?(v)
      new_c = c + 1
      next if new_c > max_c
      set.add(v)
      queue.push([v, new_c])
    end
  end
  set
end
reachable = Array.new(N)
CR.each.with_index do |(_, r), i|
  reachable[i] = reachable_vertexes(graph, i, r)
end

def shortest_path(reachable, s)
  w_list = Array.new(reachable.size, 1 << 60)
  w_list[s] = 0
  queue = PriorityQueue.new do |_, c|
    -c
  end
  queue.push([s, 0])
  while !queue.empty?
    u, w = queue.pop
    next if w > w_list[u]
    c = CR[u][0]
    reachable[u].each do |v|
      if w_list[u] + c < w_list[v]
        w_list[v] = w_list[u] + c
        queue.push([v, w_list[v]])
      end
    end
  end
  w_list
end

d = shortest_path(reachable, 0)
ans = d[N - 1]
puts ans