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

H, W = gets.split.map(&:to_i)
S = gets.split.map(&:to_i)
G = gets.split.map(&:to_i)
board = H.times.map do
  gets.split.map(&:to_i)
end

graph = Array.new(H * W) { [] }
dy = [-1, 0, 1, 0]
dx = [0, 1, 0, -1]
H.times do |i|
  W.times do |j|
    4.times do |d|
      y = i + dy[d]
      x = j + dx[d]
      next if y < 0 || y >= H || x < 0 || x >= W
      cost = board[i][j] * board[y][x]
      graph[i * W + j].push([y * W + x, cost])
    end
  end
end

def prim(graph, s)
  require 'set'
  used = Set.new
  queue = PriorityQueue.new do |_, c|
    c
  end
  queue.push([s, 0])
  ret = 0
  while !queue.empty?
    u, w = queue.pop
    next if used.include?(u)
    used.add(u)
    ret += w
    graph[u].each do |v, c|
      next if used.include?(v)
      queue.push([v, c])
    end
  end
  ret
end

ans = 0
H.times do |i|
  W.times do |j|
    ans += board[i][j]
  end
end
ans += prim(graph, 0)
puts ans